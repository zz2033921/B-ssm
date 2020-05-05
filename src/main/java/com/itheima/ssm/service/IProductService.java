package com.itheima.ssm.service;

import com.itheima.ssm.domain.Product;

import java.util.List;

public interface IProductService {
    //查询所有的商品信息或者产品信息
    public List<Product> findAll() throws Exception;

    public void save(Product product) throws  Exception;

}
