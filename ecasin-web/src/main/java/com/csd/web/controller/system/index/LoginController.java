package com.csd.web.controller.system.index;

import com.csd.common.loginUser.LoginUser;
import com.csd.exception.application.ApplicationException;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemControllerLog;
import com.csd.system.user.entity.UserRequest;
import com.csd.system.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * @desc:登录-注册
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 15:37.
 */
@Controller
public class LoginController {


    @Autowired
    private UserService userService;


    /**
     * 登录页
     * @param model
     * @return
     */
    @RequestMapping(value = {"/login","/"} , method = RequestMethod.GET)
    public String login(Model model, @RequestParam(value = "error" , required = false) String error) {
        String result = userService.login(error);
        model.addAttribute("loginError",result);
        return "index/login";
    }


    /**
     * 403
     * @param model
     * @param error
     * @return
     */
    @RequestMapping(value = "/notAuth" , method = RequestMethod.GET)
    public String notEnoughAuth(Model model,@RequestParam(value = "error" , required = false) String error){
        String result = userService.notEnoughAuth(model,error);
        model.addAttribute("notAuth",result);
        return "error/403";
    }


    /**
     * 登录成功跳转
     * @return
     */
    @RequestMapping(value = "/home" , method = RequestMethod.GET)
    @SystemControllerLog(descrption = "登录成功" , actionType = "4")
    public String index(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("user",LoginUser.getLoginUser());
        model.addAttribute("userName",LoginUser.getLoginUserName());
        return "home/index";
    }


    /**
     * 注册页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/sign" , method = RequestMethod.GET)
    public String sign(Model model){
        return "index/sign";
    }


    /**
     * 修改密码页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/forget" , method = RequestMethod.GET)
    public String forget(Model model){
        return "index/forget";
    }


    /**
     * 激活,修改密码成功页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/success" , method = RequestMethod.GET)
    public String success(Model model){
        return "index/success";
    }


    /**
     * 返回验证码
     */
    @RequestMapping(value = "/createImageCode", method = RequestMethod.GET)
    @ResponseBody
    public void createImageCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        userService.createImageCode(request,response);
    }

    /**
     * 发送短信
     * @param userPhone
     * @return
     */
    @RequestMapping(value = "/sendSms" , method = RequestMethod.POST)
    @ResponseBody
    public Result sendSms(@RequestParam(value = "phone") String userPhone, @RequestParam(value = "type") String sendType) throws Exception {
        userService.sendSms(userPhone,sendType);
        return ResultUtil.success();
    }


    /**
     * 激活 or 修改密码
     * @param request
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/register" , method = RequestMethod.POST)
    @ResponseBody
    public Result register(@Valid UserRequest request, BindingResult bindingResult) throws Exception {
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.ERROR.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        userService.register(request);
        return ResultUtil.success(request.getType());
    }

}
