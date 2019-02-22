package com.csd.common.service;

import com.csd.utils.StringUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 17:07.
 */
public class MapParaService {


    /**
     * 返回分页查询参数
     * @param request
     * @return
     */
    public static Map<String,Object> getParameter(RequestService request){
        Map<String,Object> map = new HashMap<>();
        if(!StringUtil.isEmpty(request.getStartTime())){
            map.put("startTime",request.getStartTime());
        }
        if(!StringUtil.isEmpty(request.getEndTime())){
            map.put("endTime",request.getEndTime());
        }
        if(!StringUtil.isEmpty(request.getBusName())){
            map.put("busName",request.getBusName());
        }
        if(!StringUtil.isEmpty(request.getOrgId())){
            map.put("orgId", request.getOrgId());
        }
        if(!StringUtil.isEmpty(request.getUnitId())){
            map.put("unitId", request.getUnitId());
        }
        if(!StringUtil.isEmpty(request.getDepId())){
            map.put("depId", request.getDepId());
        }
        if(!StringUtil.isEmpty(request.getSelectOption())){
            map.put("selectOption", request.getSelectOption());
        }
        return map;
    }


}
