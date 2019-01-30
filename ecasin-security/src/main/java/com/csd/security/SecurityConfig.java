package com.csd.security;

import com.csd.security.securityInterceptor.SecurityAccessDeniedHandler;
import com.csd.security.securityInterceptor.SecurityAuthenticationEntryPoint;
import com.csd.security.securityInterceptor.SecurityPasswordEncoder;
import com.csd.security.securityInterceptor.SecurityValidateCodeFilter;
import com.csd.security.securityService.SecurityUserDetailsService;
import com.csd.system.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.authentication.dao.ReflectionSaltSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:25.
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @Autowired
    private SessionRegistry sessionRegistry;

    @Autowired
    private SecurityValidateCodeFilter securityValidateCodeFilter;

    /**
     *  主要配置
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.headers().frameOptions().disable();
        http.exceptionHandling().authenticationEntryPoint(securityAuthenticationEntryPoint());
        http.exceptionHandling().accessDeniedHandler(securityAccessDeniedHandler());
        //http.addFilterBefore(securityValidateCodeFilter, UsernamePasswordAuthenticationFilter.class); // 添加验证码校验过滤器
        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/userLogin")
                .failureUrl("/login?error=1")
                .defaultSuccessUrl("/home")
                .usernameParameter("username")
                .passwordParameter("password")
                .permitAll();
        http.logout()
                .logoutUrl("/logout").permitAll()
                .logoutSuccessUrl("/login?error=2")
                .invalidateHttpSession(true);
        http.authorizeRequests()
                .antMatchers("/static/**").permitAll()
                .antMatchers("/notAuth","/login","/sign","/sendSms").permitAll()
                .antMatchers("/success","/register","/forget","/").permitAll()
                .antMatchers("/createImageCode","/user/getUser").permitAll()
                .anyRequest().authenticated();
        http.sessionManagement().maximumSessions(1).expiredUrl("/notAuth?error=1").sessionRegistry(sessionRegistry);

        http.rememberMe();
    }


    /**
     * 解决静态资源被拦截的问题
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/js/**","/css/**","/assets/**","/ico/**","/images/**","/login/**");
        web.ignoring().antMatchers("/notAuth","/login","/sign","/sendSms");
        web.ignoring().antMatchers("/success","/register","/forget","/");
        web.ignoring().antMatchers("/createImageCode","/user/getUser");
    }

    /**
     * 注入自己重写的 userDetailService
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setPasswordEncoder(new SecurityPasswordEncoder());
        authenticationProvider.setUserDetailsService(userDetailsServices());
        ReflectionSaltSource saltSource = new ReflectionSaltSource();
        saltSource.setUserPropertyToUse("username");
        authenticationProvider.setSaltSource(saltSource);
        auth.authenticationProvider(authenticationProvider);
    }

    /**
     * 注入自己的登录业务实现
     * @return
     */
    @Bean
    public SecurityUserDetailsService userDetailsServices()
    {
        return new SecurityUserDetailsService(userService);
    }


    /**
     * 重写权限
     * @return
     */
    @Bean
    public SecurityAuthenticationEntryPoint securityAuthenticationEntryPoint(){
        return new SecurityAuthenticationEntryPoint();
    }

    /**
     * 重写权限
     * @return
     */
    @Bean
    public AccessDeniedHandler securityAccessDeniedHandler() {
        return new SecurityAccessDeniedHandler();
    }


    @Bean
    public SessionRegistry getSessionRegistry(){
        SessionRegistry sessionRegistry = new SessionRegistryImpl();
        return sessionRegistry;
    }
}
