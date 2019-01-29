package com.csd.common.service;

import com.csd.exception.application.ApplicationException;
import com.csd.exception.status.BaseStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:47.
 */
@Service
public abstract class DeleteService<T> {


    /**
     * 设置删除人信息和改变实体状态
     * @param t
     * @return
     */
    public abstract Integer deleteEntity(T t);

    /**
     * 根据ID查询实体类
     * @param recordId
     * @return
     */
    public abstract T selectByPrimaryKey(String recordId);


    /**
     * 删除
     * @param recordIds
     * @throws Exception
     */
    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    public String commonDeleteEntity(String[] recordIds) throws Exception {
        String result ;
        if(recordIds != null && recordIds.length > 0){
            if(recordIds.length == 1){
                result =  singleDeleteEntity(recordIds[0]);
            }else{
                result = moreDeleteEntity(recordIds);
            }
        }else {
            throw new ApplicationException(BaseStatus.DELETE_NULL.getCode(),BaseStatus.DELETE_NULL.getMessage());
        }
        return result;
    }


    /**
     * 单个删除
     * @param recordId
     * @throws Exception
     */
    public String singleDeleteEntity(String recordId) throws ApplicationException {
        String result;
        T t = selectByPrimaryKey(recordId);
        int count = deleteEntity(t);
        if(count < 1){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        result = "成功删除一条数据";
        return result;
    }

    /**
     * 多个删除
     * @param recordIds
     * @throws Exception
     */
    public String moreDeleteEntity(String[] recordIds) throws Exception {
        String result;
        int success = 0;
        int error = 0;
        for (int i = 0; i < recordIds.length; i++) {
            T t = selectByPrimaryKey(recordIds[i]);
            int count = deleteEntity(t);
            if(count == 1){
                success ++;
            }else{
                error ++;
            }
        }
        result = "成功删除" + success + "条数据,失败" + error + "条数据";

        return result;
    }

}
