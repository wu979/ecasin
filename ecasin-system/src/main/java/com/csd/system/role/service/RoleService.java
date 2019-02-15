package com.csd.system.role.service;

import com.csd.common.loginUser.LoginUser;
import com.csd.common.page.PageVo;
import com.csd.common.service.MapParaService;
import com.csd.security.securityEntity.User;
import com.csd.system.role.dao.RoleMapper;
import com.csd.system.role.po.Role;
import com.csd.system.role.request.RoleRequest;
import com.csd.utils.StringUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:22.
 */
@Service
public class RoleService {

    @Resource
    private RoleMapper roleMapper;

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


}
