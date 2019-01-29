package com.csd.generator;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 16:26.
 */
public class GeneratorHelper {

    /**
     * 生成地址
     */
    public static final String Dir = "D:/app-mybatis/";

    public static final String Author = "bluebing@outlook.com";

    public static final String DriverName = "com.mysql.cj.jdbc.Driver";

    public static final String UserName = "root";

    public static final String PassWord = "Erp#2017";

    public static final String Url = "jdbc:mysql://localhost:3306/test?characterEncoding=utf8&serverTimezone=GMT%2B8";


    public static void generatorClass(){
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(Dir);
        gc.setFileOverride(true);
        gc.setActiveRecord(true);// 开启 activeRecord 模式
        gc.setEnableCache(true);// XML 二级缓存
        gc.setBaseResultMap(true);// XML ResultMap
        gc.setBaseColumnList(true);// XML columList
        gc.setAuthor(Author);

        // 自定义文件命名，注意 %s 会自动填充表实体属性！
        //gc.setMapperName("%sDao");
        //gc.setXmlName("%sDao");
        gc.setServiceName("I%sService");
        gc.setControllerName("%sController");
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setTypeConvert(new MySqlTypeConvert());
        dsc.setDriverName(DriverName);
        dsc.setUsername(UserName);
        dsc.setPassword(PassWord);
        dsc.setUrl(Url);
        mpg.setDataSource(dsc);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setTablePrefix(new String[]{"w_"});// 此处可以修改为您的表前缀, "mp_"
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        //"ec_user", "ec_user_auth",
        //strategy.setInclude(new String[]{"ec_user_cash_record", "ec_user_charge", "ec_user_charge_admin", "ec_user_transfer", "ec_slide", "ec_slide_cat", "ec_provider", "ec_cp_game","ec_user_coin_record","ec_notice","ec_activity"，"ec_payment_cat"});
        strategy.setInclude(new String[]{"w_menu"});
        // strategy.setExclude(new String[]{"test"}); // 排除生成的表
        strategy.setSuperServiceClass("com.boot.generator.service");
        strategy.setSuperEntityClass("com.boot.generator.po");
        strategy.setSuperMapperClass("com.boot.generator.dao");
        mpg.setStrategy(strategy);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName("system"); //顺风模块
        pc.setParent("com.boot");// 自定义包路径
        pc.setController("controller");// 这里是控制器包名，默认 web
        mpg.setPackageInfo(pc);
        // 执行生成
        mpg.execute();
    }

    public static void main(String[] args) {
        GeneratorHelper.generatorClass();
    }
}
