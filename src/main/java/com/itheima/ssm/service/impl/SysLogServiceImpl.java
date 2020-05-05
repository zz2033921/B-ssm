package com.itheima.ssm.service.impl;

import com.itheima.ssm.dao.ISysDao;
import com.itheima.ssm.domain.Syslog;
import com.itheima.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {
    @Autowired
    private ISysDao dao;
    @Override
    public void save(Syslog syslog)throws  Exception {
    dao.save(syslog);
    }

    @Override
    public List<Syslog> findall()throws Exception {
        return dao.findAll();
    }
}
