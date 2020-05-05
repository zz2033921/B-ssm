package com.itheima.ssm.service;

import com.itheima.ssm.domain.Syslog;

import java.util.List;

public interface ISysLogService  {
    void  save(Syslog syslog) throws  Exception;

    List<Syslog> findall() throws  Exception;
}
