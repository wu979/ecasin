package com.csd.web.config.service;

import com.csd.security.securityEntity.SecurityUserDetails;
import com.csd.system.menu.po.Menu;
import com.csd.system.role.po.Role;
import com.csd.system.user.po.User;
import com.csd.system.user.service.UserService;
import com.csd.utils.BeanCopyUtil;
import org.assertj.core.util.Sets;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 13:24.
 */
@Component
public class SecurityUserDetailsService implements UserDetailsService {

    private UserService userService;


    public SecurityUserDetailsService(UserService userService){
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        User user = userService.findByUserName(username);
        if(user == null) {
            throw new UsernameNotFoundException("用户名不正确!");
        }
        List<String> userRoleCodeList = new ArrayList<String>();
        List<String> userRoleIdList = new ArrayList<>();
        Set<GrantedAuthority> authSet = Sets.newHashSet();
        List<Role> roleList = user.getRoleList();
        if(null != roleList && !roleList.isEmpty()) {
            for (Role role : roleList)
            {
                authSet.add(new SimpleGrantedAuthority(role.getRoleCode()));
                userRoleCodeList.add(role.getRoleCode());
                userRoleIdList.add(role.getRoleId());
            }
        }
        if(!userRoleIdList.isEmpty()){
            List<Menu> menuList = userService.getMenuListByRoleList(userRoleIdList);
            if(null != menuList && !menuList.isEmpty()){
                for(Menu menu : menuList)
                {
                    authSet.add(new SimpleGrantedAuthority(menu.getMenuCode()));
                }
            }
        }

        SecurityUserDetails securityUserDetails = new SecurityUserDetails
                (user.getUserPhone(),user.getUserPassword(),true,true,true,true,authSet);
        com.csd.security.securityEntity.User userEntity = BeanCopyUtil.copy(user, com.csd.security.securityEntity.User.class);
        securityUserDetails.setUser(userEntity);
        securityUserDetails.setUserRoleCodeList(userRoleCodeList);
        return securityUserDetails;
    }

}
