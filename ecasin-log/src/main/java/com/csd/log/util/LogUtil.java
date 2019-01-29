package com.csd.log.util;

import com.csd.log.holder.SpringContextHolder;
import com.csd.log.systemLog.po.SystemLog;
import com.csd.log.systemLog.service.SystemLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 15:26.
 */
public class LogUtil {


    private final static Logger logger = LoggerFactory.getLogger(LogUtil.class);

    /**
     *  number 指定该线程池 运行线程的最大数目
     *
     *  Executors.newCachedThreadPool() 可变尺寸 类似于list
     */
    private static ExecutorService executorService = Executors.newFixedThreadPool(10);

    private static SystemLogService systemLogService = SpringContextHolder.getBean("systemLogService");


    public static void writeMainLog(SystemLog log) {
        executorService.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    if (systemLogService != null) {
                        logger.info("----------插入日志----------" + "线程:-----------" + Thread.currentThread().getName());
                        systemLogService.insertSelective(log);
                        logger.info("----------结束日志----------" + "线程:-----------" + Thread.currentThread().getName());
                    } else {
                        logger.error("spring init bean fail,please check configs");
                        logger.error("注入失败");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }


}
