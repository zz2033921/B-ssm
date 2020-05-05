package com.itheima.ssm.controller;

import com.itheima.ssm.dao.IUserDao;
import com.itheima.ssm.domain.Role;
import com.itheima.ssm.domain.UserInfo;
import com.itheima.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService iUserService;


    //根据id查询
    @RequestMapping("/findById.do")
    public ModelAndView findById( String id) throws  Exception{
        ModelAndView mv =new ModelAndView();
        UserInfo userInfo = iUserService.findById(id);
        mv.setViewName("user-show");
        mv.addObject("user",userInfo);
        return mv;
    }
    //用户添加
    @RequestMapping("/save.do")
    //获取当前登录姓名
    //spel表达式---SpringEl表达式
    @PreAuthorize("authentication.principal.username=='tom'")
    public String save(UserInfo userInfo) throws  Exception{
        iUserService.save(userInfo);

        return "redirect:findAll.do";
    }
    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<UserInfo> uesrlist=iUserService.findAll();
        mv.setViewName("user-list");
        mv.addObject("userList",uesrlist);
        return mv;
    }

    //用户关联角色操作--查询用户以及用户可以添加的角色
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true) String userId) throws Exception {
        ModelAndView mv =new ModelAndView();
        //1.根据用户id 查询用户
         UserInfo byId = iUserService.findById(userId);
        //2.根据用户id 查询可以添加的角色
        List<Role> otherRoles=iUserService.findOtherRoles(userId);
        mv.addObject("user",byId);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }
    //给用户添加角色
    @RequestMapping("/addRoleToUser")
    public String  addRoleToUser(@RequestParam(name = "userId",required = true)String userId,@RequestParam(name = "ids",required = true)String[] roleId) throws Exception{
        iUserService.addRoleToUser(userId,roleId);
        return "redirect:findAll.do";
    }
}
