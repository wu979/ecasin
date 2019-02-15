package com.csd.web.controller.common.constant;

import com.csd.common.constant.po.Constant;
import com.csd.common.constant.request.ConstantRequest;
import com.csd.common.constant.service.ConstantService;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/14 15:30.
 */
@Controller
@RequestMapping("/constant")
public class ConstantController {


    @Autowired
    private ConstantService constantService;


    /**
     * 根据类型查询 下拉常量列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/findByList", method = RequestMethod.POST)
    @ResponseBody
    public Result findByList(ConstantRequest request){
        List<Constant> constantList = constantService.findByList(request);
        return ResultUtil.success(constantList);
    }


}
