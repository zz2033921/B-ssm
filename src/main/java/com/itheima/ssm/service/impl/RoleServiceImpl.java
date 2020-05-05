package com.itheima.ssm.service.impl;

import com.itheima.ssm.dao.IRoleDao;
import com.itheima.ssm.domain.Permission;
import com.itheima.ssm.domain.Role;
import com.itheima.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleDao iRoleDao;

    @Override
    public List<Role> findAll() throws Exception {
        return iRoleDao.findAll();
    }

    @Override
    public void save(Role role)throws Exception {
        iRoleDao.save(role);
    }
    //详情查询


    @Override
    public Role findById(String roleId) throws Exception {
        return iRoleDao.findById(roleId);
    }

    @Override
    public void deleteById(String roleId) throws Exception {
        //从User_role表中删除
        iRoleDao.deleteFromUser_RoleByRoleId(roleId);
        //从role_perminssion表中删除
        iRoleDao.deleteFromRole_PermissionByRoleId(roleId);
        //从role表中删除
        iRoleDao.deleteRoleById(roleId);

    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) throws Exception {
        return iRoleDao.findRoleByIdAndAllPermission(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) throws Exception {
        for (String permissionId : permissionIds) {
            iRoleDao.addPermissionToRole(roleId,permissionId);
        }
    }
}
