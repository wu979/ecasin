package com.csd.system.code.service;

import com.csd.system.code.dao.CheckCodeMapper;
import com.csd.system.code.po.CheckCode;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:43.
 */
@Service
public class CheckCodeService {

    @Resource
    private CheckCodeMapper checkCodeMapper;

    public CheckCode checkCode(String phone, String type){
        Map<String,Object> map = new HashMap<>();
        map.put("phone",phone);
        map.put("type",type);
        return checkCodeMapper.getCodeByPhone(map);
    }

    public int insert(CheckCode record){
        return checkCodeMapper.insert(record);
    }

}
