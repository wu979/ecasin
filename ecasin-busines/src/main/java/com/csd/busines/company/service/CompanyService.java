package com.csd.busines.company.service;

import com.csd.busines.company.dao.CompanyMapper;
import com.csd.busines.company.po.Company;
import com.csd.common.loginUser.LoginUser;
import com.csd.common.tree.TreeOptions;
import com.csd.common.utils.TreeUtil;
import com.csd.security.securityEntity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/15 15:05.
 */
@Service
public class CompanyService {

    @Resource
    private CompanyMapper companyMapper;


    @SuppressWarnings("unchecked")
    public List<Company> getCompanyList() throws Exception {
        User user = LoginUser.getLoginUser();
        List<Company> companyList = companyMapper.findListByOrgId(user.getUserOrgId());
        TreeOptions options = new TreeOptions(companyList);
        assignmentTreeOptions(options);
        options.setShowRoot(true);
        options.setOpenAll(true);
        options.setRootText("所有目录");
        return TreeUtil.getListForJqgridTree(options);
    }

    @SuppressWarnings("unchecked")
    public List<Company> getCompanyListByNotAll() throws Exception {
        User user = LoginUser.getLoginUser();
        List<Company> companyList = companyMapper.findListByOrgId(user.getUserOrgId());
        TreeOptions options = new TreeOptions(companyList);
        assignmentTreeOptions(options);
        options.setShowRoot(false);
        options.setOpenAll(false);
        return TreeUtil.getListForJqgridTree(options);
    }


    public void assignmentTreeOptions(TreeOptions options){
        //添加额外参数
        //options.setExtendedFields(new String[]{"publicCatalogType", "publicCatalogHasChild"});
        options.setId("companyId");
        options.setText("companyName");
        options.setNodeLevel("companyLevel");
        options.setHasChild("companyHasChild");
        options.setParentId("companyParentId");
        options.setOrgType("undefined");
    }
}
