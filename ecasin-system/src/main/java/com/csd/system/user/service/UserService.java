package com.csd.system.user.service;

import com.csd.exception.application.ApplicationException;
import com.csd.exception.status.BaseStatus;
import com.csd.system.code.po.CheckCode;
import com.csd.system.code.service.CheckCodeService;
import com.csd.system.menu.dao.MenuMapper;
import com.csd.system.menu.po.Menu;
import com.csd.system.role.dao.RoleMapper;
import com.csd.system.role.po.Role;
import com.csd.system.user.dao.UserMapper;
import com.csd.system.user.entity.UserRequest;
import com.csd.system.user.po.User;
import com.csd.utils.*;
import com.csd.utils.entity.CodeImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 16:09.
 */
@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private MenuMapper menuMapper;

    @Autowired
    private CheckCodeService checkCodeService;


    public void login(Model model, String error){
        if (!StringUtil.isEmpty(error)) {
            if (error.equals(ConstantUtil.ERROR_ONE)) {
                model.addAttribute("loginError", true);
            }
            if (error.equals(ConstantUtil.ERROR_TWO)) {
                model.addAttribute("loginOut", true);
            }
            if (error.equals(ConstantUtil.ERROR_THREE)) {
                model.addAttribute("sessionIsValid", true);
            }
            if (error.equals(ConstantUtil.ERROR_FOUR)) {
                model.addAttribute("codeNull", true);
            }
            if (error.equals(ConstantUtil.ERROR_FIVE)) {
                model.addAttribute("codeIsExist", true);
            }
            if (error.equals(ConstantUtil.ERROR_SIX)) {
                model.addAttribute("codeIsValid", true);
            }
            if (error.equals(ConstantUtil.ERROR_SEVEN)) {
                model.addAttribute("codeError", true);
            }
        }
    }

    public void notEnoughAuth(Model model,String error){
        if (!StringUtil.isEmpty(error)) {
            if (error.equals(ConstantUtil.ERROR_ONE)) {
                model.addAttribute("maximumSession", true);
            }
            if (error.equals(ConstantUtil.ERROR_TWO)) {
                model.addAttribute("sessionExpired", true);
            }
        }
    }

    public User selectByPhone(String userPhone){
        return userMapper.selectByPhone(userPhone);
    }

    public int updateByPrimaryKeySelective(User record){
        return userMapper.updateByPrimaryKeySelective(record);
    }

    public int insertSelective(User record){
        return userMapper.insertSelective(record);
    }

    public User findByUserName(String userPhone){
        User user = userMapper.findByUserName(userPhone);
        if (null != user) {
            List<Role> roleList = roleMapper.getRoleListByJobId(user.getPtJobId());
            if(null != roleList && !roleList.isEmpty()){
                user.setRoleList(roleList);
            }
        }
        return user;
    }

    public List<Menu> getMenuListByRoleList(List<String> roleList){
        return menuMapper.getMenuListByRoleList(roleList);
    }

    public void sendSms(String userPhone, String sendType) throws Exception {
        if(StringUtil.isEmpty(userPhone)){
            throw new ApplicationException(BaseStatus.PHONE_NOT_EXIST.getCode(),BaseStatus.PHONE_NOT_EXIST.getMessage());
        }

        User user = userMapper.selectByPhone(userPhone);
        if(StringUtil.isObjectEmpty(user)){
            throw new ApplicationException(BaseStatus.USER_IS_NOT_EXIST.getCode(),BaseStatus.USER_IS_NOT_EXIST.getMessage());
        }else {
            if(sendType.equals(ConstantUtil.CODE_ONE)) {
                if (!user.getUserIsActive().equals(ConstantUtil.CODE_ONE)) {
                    throw new ApplicationException(BaseStatus.SIGN_PHONE_EXIST.getCode(), BaseStatus.SIGN_PHONE_EXIST.getMessage());
                }
            }
            if(sendType.equals(ConstantUtil.CODE_TWO)){
                if (!user.getUserIsActive().equals(ConstantUtil.CODE_THREE)) {
                    throw new ApplicationException(BaseStatus.PHONE_WAIT_CONFIRM.getCode(), BaseStatus.PHONE_WAIT_CONFIRM.getMessage());
                }
            }
        }

        String code = RandomUtil.generateNumber(5);
        String s = SendSMS.sendSMS(userPhone, code, ConstantUtil.TIME_FIVE, sendType);
        HashMap<String,Object> map =  JsonUtils.toHashMap(s);
        if(map.get("reason").equals(ConstantUtil.CREATE_SUCCESS)){
            CheckCode checkCode = new CheckCode();
            checkCode.setCodeId(UUIDUtil.getUUID());
            checkCode.setCodePhone(userPhone);
            checkCode.setCodeNumber(Integer.valueOf(code));
            checkCode.setCodeTime(DateUtil.getTime());
            checkCode.setCodeType(sendType);
            checkCodeService.insert(checkCode);
        }else {
            throw new ApplicationException(BaseStatus.CODE_SEND_ERROR.getCode(),BaseStatus.CODE_SEND_ERROR.getMessage());
        }
    }

    public void register(UserRequest request) throws Exception {
        if(!request.getUserPassword().equals(request.getRepeatPassword())){
            throw new ApplicationException(BaseStatus.PASSWORD_NOT_LIKE.getCode(),BaseStatus.PASSWORD_NOT_LIKE.getMessage());
        }

        CheckCode checkCode = checkCodeService.checkCode(request.getUserPhone(), request.getType());
        if(StringUtil.isObjectEmpty(checkCode)){
            throw new ApplicationException(BaseStatus.CODE_NOT_EXIST.getCode(),BaseStatus.CODE_NOT_EXIST.getMessage());
        }else{
            String code = String.valueOf(checkCode.getCodeNumber());
            if(!code.equals(request.getCode())){
                throw new ApplicationException(BaseStatus.CODE_IS_ERROR.getCode(),BaseStatus.CODE_IS_ERROR.getMessage());
            }else {
                int between = DateUtil.between(DateUtil.getDateTime(checkCode.getCodeTime()), new Date(), Calendar.MINUTE);
                if(between > 5){
                    throw new ApplicationException(BaseStatus.CODE_IS_OVERDUE.getCode(),BaseStatus.CODE_IS_OVERDUE.getMessage());
                }
            }
        }

        User user = userMapper.selectByPhone(request.getUserPhone());
        if(StringUtil.isObjectEmpty(user)){
            throw new ApplicationException(BaseStatus.USER_IS_NOT_EXIST.getCode(),BaseStatus.USER_IS_NOT_EXIST.getMessage());
        }
        if(request.getType().equals(ConstantUtil.CODE_ONE)) {
            if (!user.getUserIsActive().equals(ConstantUtil.CODE_ONE)) {
                throw new ApplicationException(BaseStatus.SIGN_PHONE_EXIST.getCode(), BaseStatus.SIGN_PHONE_EXIST.getMessage());
            }
            user.setUserState(ConstantUtil.CODE_ONE);
            user.setUserIsActive(ConstantUtil.CODE_TWO);
            user.setUserType(ConstantUtil.CODE_THREE);
        }
        user.setUserPassword(PasswordUtil.SHA1(request.getUserPassword(),request.getUserPhone()));
        userMapper.updateByPrimaryKeySelective(user);
    }


    public void createImageCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ServletOutputStream out = response.getOutputStream();
        try {
            CodeImage imageCode = CodeUtil.createImageCode();
            response.setHeader("Pragma", "no-cache");//禁止缓存
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/png");
            request.getSession().setAttribute("codeImage", imageCode);
            ImageIO.write(imageCode.getImage(), "png", out);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            out.flush();
            out.close();
        }
    }


    public User selectByPrimaryKey(String userId){
        return userMapper.selectByPrimaryKey(userId);
    }
}
