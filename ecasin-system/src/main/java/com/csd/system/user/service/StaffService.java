package com.csd.system.user.service;

import com.csd.common.loginUser.LoginUser;
import com.csd.common.page.PageVo;
import com.csd.system.user.dao.UserMapper;
import com.csd.system.user.entity.StaffRequest;
import com.csd.system.user.po.User;
import com.csd.utils.ConstantUtil;
import com.csd.utils.StringUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/27 16:41.
 */
@Service
public class StaffService {

    @Resource
    private UserMapper userMapper;


    public PageVo<User> findByPage(PageVo<User> page, StaffRequest request){
        com.csd.security.securityEntity.User user = LoginUser.getLoginUser();
        PageBounds pageBounds = page.pageToPageBounds(page);
        Map<String, Object> parameter = new HashMap<>();
        if(!StringUtil.isEmpty(request.getBusName())){
            parameter.put("busName",request.getBusName());
        }
        if(!StringUtil.isEmpty(request.getSelectOption())){
            parameter.put("selectOption",request.getSelectOption());
        }
        parameter.put("orgId",user.getUserOrgId());
        parameter.put("userType", ConstantUtil.CODE_THREE);
        PageList<User> findByPage = userMapper.findByPage(parameter, pageBounds);
        page.listToPage(page,findByPage);
        return page;
    }
}
