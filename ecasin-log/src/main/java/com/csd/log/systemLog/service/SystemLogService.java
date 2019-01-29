package com.csd.log.systemLog.service;

import com.csd.log.systemLog.dao.SystemLogMapper;
import com.csd.log.systemLog.po.SystemLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 15:01.
 */
@Service("systemLogService")
public class SystemLogService {


    @Resource
    private SystemLogMapper systemLogMapper;

    public int insertSelective(SystemLog record){
        return systemLogMapper.insertSelective(record);
    }

}
