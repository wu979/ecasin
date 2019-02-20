package com.csd.system.role.service;

import com.csd.common.constant.dao.ConstantMapper;
import com.csd.common.constant.po.Constant;
import com.csd.common.loginUser.LoginUser;
import com.csd.common.page.PageVo;
import com.csd.common.service.DeleteService;
import com.csd.common.service.MapParaService;
import com.csd.exception.application.ApplicationException;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemServiceLog;
import com.csd.security.securityEntity.User;
import com.csd.system.role.dao.RoleMapper;
import com.csd.system.role.po.Role;
import com.csd.system.role.request.RoleRequest;
import com.csd.utils.ConstantUtil;
import com.csd.utils.DateUtil;
import com.csd.utils.StringUtil;
import com.csd.utils.UUIDUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:22.
 */
@Service
public class RoleService extends DeleteService<Role> {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private ConstantMapper constantMapper;


    /**
     * 角色页面列表
     *
     * @return
     */
    public PageVo<Role> findByPage(PageVo<Role> page, RoleRequest request){
        User user = LoginUser.getLoginUser();
        PageBounds pageBounds = page.pageToPageBounds(page);
        Map<String, Object> parameter = MapParaService.getParameter(request);
        if(!StringUtil.isEmpty(request.getOrgId())){
            parameter.put("orgId", request.getOrgId());
        }else {
            if(!StringUtil.isEmpty(user.getUserOrgId())){
                parameter.put("orgId",user.getUserOrgId());
            }else {
                parameter.put("orgId",null);
            }
        }
        PageList<Role> rolePage = roleMapper.findByPage(parameter, pageBounds);
        page.listToPage(page,rolePage);
        return page;
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "新增角色")
    public void save(Role role){
        Map<String,Object> map = new HashMap<>();
        User user = LoginUser.getLoginUser();
        if(!user.getUserType().equals(ConstantUtil.CODE_ZERO) && !user.getUserType().equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        String days = DateUtil.getDays();
        String date = DateUtil.timeStamp();
        role.setRoleId(UUIDUtil.getUUID());
        role.setRoleCreateUserId(user.getUserId());
        role.setRoleCreateTime(DateUtil.getTime());
        role.setRoleIsValid(ConstantUtil.CODE_ONE);
        role.setRoleCode("ROLE_"+days+date);
        Constant byConstant = null;
        map.put("constantType","roleType");
        switch (user.getUserType()){
            case ConstantUtil.CODE_ZERO:
                map.put("constantValue",ConstantUtil.CODE_TWO);
                byConstant = constantMapper.findByConstant(map);

                role.setRoleType(byConstant.getConstantId());
                break;
            default:
                map.put("constantValue",ConstantUtil.CODE_THREE);
                byConstant = constantMapper.findByConstant(map);
                role.setRoleOrgId(user.getUserOrgId());
                role.setRoleType(byConstant.getConstantId());
                break;
        }

        roleMapper.insertSelective(role);
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "修改角色")
    public void update(Role role){
        User user = LoginUser.getLoginUser();
        if(!user.getUserType().equals(ConstantUtil.CODE_ZERO) && !user.getUserType().equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        role.setRoleUpdateUserId(user.getUserId());
        role.setRoleUpdateTime(DateUtil.getTime());

        roleMapper.updateByPrimaryKeySelective(role);
    }


    public Role selectByPrimaryKey(String roleId){
        return roleMapper.selectByPrimaryKey(roleId);
    }


    @Override
    @SystemServiceLog(descrption = "删除角色")
    public Integer deleteEntity(Role role) throws Exception {
        int result;
        String constantValue = constantMapper.findValueById(role.getRoleType());
        if(constantValue.equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_DELETE.getCode(),BaseStatus.ROLE_ADMIN_NOT_DELETE.getMessage());
        }
        role.setRoleUpdateUserId(LoginUser.getLoginUserId());
        role.setRoleUpdateTime(DateUtil.getTime());
        role.setRoleIsValid(ConstantUtil.CODE_ZERO);
        result = roleMapper.updateByPrimaryKeySelective(role);
        return result;
    }
}
