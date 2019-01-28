package com.csd.web;

import com.github.miemiedev.mybatis.paginator.OffsetLimitInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;
import org.springframework.web.bind.annotation.ControllerAdvice;

import javax.sql.DataSource;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 14:46.
 */
@EnableTransactionManagement(proxyTargetClass = true)
@ComponentScan(
            basePackages = {"com.csd.web", "com.csd.system","com.csd.busines"},
            excludeFilters = {
                              @ComponentScan.Filter(type = FilterType.ANNOTATION, value = Controller.class),
                              @ComponentScan.Filter(type = FilterType.ANNOTATION, value = ControllerAdvice.class),
                              @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, value = WebConfig.class)
                             }
             )
public class MybatisConfig implements TransactionManagementConfigurer {


    @Autowired
    private DataSource dataSource;

    /**
     * mybatis注入数据源
     * @return
     */
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean() {
        SqlSessionFactory sqlSessionFactory = null;
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.csd.**.po");

        //扫描XML
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        try
        {
            sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath*:com/csd/**/dao/mapper/*Mapper.xml"));
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        //添加分页插件
        Interceptor[] plugins = {mysqlPaginationInterceptor()};
        sqlSessionFactoryBean.setPlugins(plugins);

        try
        {
            sqlSessionFactory =  sqlSessionFactoryBean.getObject();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return sqlSessionFactory;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public Interceptor mysqlPaginationInterceptor()
    {
        OffsetLimitInterceptor limitInterceptor = new OffsetLimitInterceptor();
        limitInterceptor.setDialectClass("com.github.miemiedev.mybatis.paginator.dialect.MySQLDialect");
        return limitInterceptor;
    }

}
