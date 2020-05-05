package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Member;
import com.itheima.ssm.domain.Product;
import com.itheima.ssm.domain.Product;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {
    //根据id查询产品
    @Select("select * from member where id=#{id} ")
    Member findById (String id)throws Exception;
}
