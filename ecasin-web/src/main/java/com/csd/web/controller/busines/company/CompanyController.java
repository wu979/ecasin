package com.csd.web.controller.busines.company;

import com.csd.busines.company.service.CompanyService;
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
 * @date: 2019/2/15 16:10.
 */
@Controller
@RequestMapping("/company")
public class CompanyController {


    @Autowired
    private CompanyService companyService;


    /**
     * 公司架构
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/companyTree", method = RequestMethod.POST)
    @ResponseBody
    public List<?> getCompanyList() throws Exception {
        return companyService.getCompanyList();
    }


}
