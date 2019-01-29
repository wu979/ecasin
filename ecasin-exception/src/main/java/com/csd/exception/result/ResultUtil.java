package com.csd.exception.result;

import com.csd.exception.status.BaseStatus;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 13:43.
 */
public class ResultUtil {


    /**
     * 返回成功，传入返回体具体出參
     * @param object
     * @return
     */
    public static Result success(Object object){
        Result result = new Result();
        result.setStatus(BaseStatus.SUCCESS.getCode());
        result.setMessage(BaseStatus.SUCCESS.getMessage());
        result.setData(object);
        return result;
    }

    /**
     * 提供给部分不需要出參的接口
     * @return
     */
    public static Result success(){
        return success(null);
    }

    /**
     * 自定义错误信息
     * @param code
     * @param msg
     * @return
     */
    public static Result error(Integer code, String msg){
        Result result = new Result();
        result.setStatus(code);
        result.setMessage(msg);
        result.setData(null);
        return result;
    }

    /**
     * 返回异常信息，在已知的范围内
     * @param baseStatus
     * @return
     */
    public static Result error(BaseStatus baseStatus){
        Result result = new Result();
        result.setStatus(baseStatus.getCode());
        result.setMessage(baseStatus.getMessage());
        result.setData(null);
        return result;
    }


}
