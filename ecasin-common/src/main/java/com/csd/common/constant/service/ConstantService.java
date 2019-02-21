package com.csd.common.constant.service;

import com.csd.common.constant.dao.ConstantMapper;
import com.csd.common.constant.po.Constant;
import com.csd.common.constant.request.ConstantRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/14 15:29.
 */
@Service
public class ConstantService {

    @Resource
    private ConstantMapper constantMapper;

    public List<Constant> findByList(ConstantRequest request){
        Map<String,Object> map = new HashMap<>();
        map.put("constantType",request.getConstantType());
        return constantMapper.findByList(map);
    }


    public String findValueById(String constantId){
        return constantMapper.findValueById(constantId);
    }
}
