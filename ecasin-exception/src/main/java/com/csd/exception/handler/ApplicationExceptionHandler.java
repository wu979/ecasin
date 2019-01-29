package com.csd.exception.handler;

import com.csd.exception.application.ApplicationException;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.exception.status.BaseStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 13:21.
 */
@ControllerAdvice
public class ApplicationExceptionHandler {

    private final static Logger logger = LoggerFactory.getLogger(ApplicationExceptionHandler.class);

    /**
     * 自定义异常
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result handlerException(Exception e) {
        if(e instanceof ApplicationException){
            ApplicationException exception = (ApplicationException) e;
            return ResultUtil.error(exception.getCode(),exception.getMessage());
        }
        logger.info("【系统异常】{}",e);
        return ResultUtil.error(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
    }


}

