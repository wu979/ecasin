package com.csd.system.role.service;

import com.csd.system.role.dao.RoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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

    //public PageVo<Role> findByPage(PageVo<Role> page, RoleRequest request){
    //    PageBounds pageBounds = page.pageToPageBounds(page);
    //    Map<String,Object> map = new HashMap<>();
    //    if(!StringUtils.isEmpty(request.getStartTime())){
    //        map.put("startTime",request.getStartTime());
    //    }
    //    if(!StringUtils.isEmpty(request.getStartTime())){
    //        map.put("endTime",request.getEndTime());
    //    }
    //    if(!StringUtils.isEmpty(request.getStartTime())){
    //        map.put("name",request.getName());
    //    }
    //    if(!StringUtils.isEmpty(LoginUser.getLoginUser().getUserOrgId())){
    //        map.put("orgId", LoginUser.getLoginUser().getUserOrgId());
    //    }
    //    PageList<Role> rolePage = roleMapper.findByPage(map, pageBounds);
    //    page.listToPage(page,rolePage);
    //    return page;
    //}
}
