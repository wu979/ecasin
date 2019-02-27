package com.csd.web.controller.system.home;

import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.system.menu.po.Tree;
import com.csd.system.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @desc:系统首页
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 15:46.
 */
@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private MenuService menuService;

    /**
     * 获取登录人的菜单
     * @return
     */
    @RequestMapping(value = "/getTreeList" , method = RequestMethod.POST)
    @ResponseBody
    public Result getTreeList() throws Exception {
        List<Tree> treeList = menuService.getMenuParentByUserId();
        return ResultUtil.success(treeList);
    }


    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String index(Model model){
        return "home/home";
    }
}
