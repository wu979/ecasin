package com.csd.busines.company.dao;

import com.csd.busines.company.po.Company;

import java.util.List;

public interface CompanyMapper {
    
    int deleteByPrimaryKey(String companyId);

    
    int insert(Company record);

    
    int insertSelective(Company record);

    
    Company selectByPrimaryKey(String companyId);

    
    int updateByPrimaryKeySelective(Company record);

    
    int updateByPrimaryKey(Company record);


    List<Company> findListByOrgId(String companyId);
}