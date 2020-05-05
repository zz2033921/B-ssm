package com.itheima.ssm.controller;

import com.itheima.ssm.domain.Permission;
import com.itheima.ssm.domain.Role;
import com.itheima.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService iRoleService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        List<Role> all = iRoleService.findAll();
        ModelAndView mv =new ModelAndView();
        mv.addObject("roleList",all);
        mv.setViewName("role-list");
        return mv;
    }


    @RequestMapping("/save.do")
    public String save(Role role) throws Exception{
        iRoleService.save(role);
        return "redirect:findAll.do";
    }
    //详情查询
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String roleId) throws Exception {
        ModelAndView mv =new ModelAndView();
        Role role=iRoleService.findById(roleId);

        mv.addObject("role",role);
        mv.setViewName("role-show");

        return  mv;
    }
    //根据id删除
    @RequestMapping("/deleteById.do")
    public  String deleteById(@RequestParam(name = "id",required = true) String roleId) throws  Exception{
        iRoleService.deleteById(roleId);
        return "redirect:findAll.do";
    }

    //角色权限查询
    @RequestMapping("/findRoleByIdAndAllPermission")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true) String roleId) throws Exception{
        System.out.println("---------------"+roleId);
        ModelAndView mv =new ModelAndView();
        //根据roleid查询角色
        Role role = iRoleService.findById(roleId);
        //根据角色id查询可以添加的权限
       List<Permission> otherPermissions =iRoleService.findOtherPermissions(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",otherPermissions);
        mv.setViewName("role-permission-add");

        return mv;
    }

    //添加角色的方法
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true)String roleId,@RequestParam(name = "ids",required = true)String[] permissionIds) throws  Exception{
        iRoleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }





}
