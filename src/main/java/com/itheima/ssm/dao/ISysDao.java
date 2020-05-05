package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Syslog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysDao {
    @Insert("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    public void save(Syslog syslog) throws Exception;
    @Select("select * from syslog")
    List<Syslog> findAll() throws  Exception;
}
