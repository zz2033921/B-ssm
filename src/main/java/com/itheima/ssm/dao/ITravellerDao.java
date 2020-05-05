package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITravellerDao {
    @Select("select * from traveller where id in(select travellerId from order_traveller where orderId=#{ordersid})")
    public List<Traveller> findByordersId(String ordersid)throws  Exception;

}
