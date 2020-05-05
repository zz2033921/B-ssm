package com.itheima.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.ssm.domain.Orders;
import com.itheima.ssm.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersService iOrdersService;

//    //查询所有orders---未分页
//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll() throws Exception {
//        ModelAndView mv =new ModelAndView();
//        List<Orders> all = iOrdersService.findAll();
//        for (Orders orders : all) {
//            System.out.println(orders);
//        }
//        mv.addObject("ordersList",all);
//        mv.setViewName("orders-list");
//        return mv;
//    }
        @RequestMapping("/findAll.do")
        @Secured("ROLE_ADMIN")
        public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")int page,@RequestParam(name="size" ,required = true,defaultValue = "4")int size) throws Exception{
            ModelAndView mv =new ModelAndView();
            List<Orders> all = iOrdersService.findAll(page, size);
            //pageInfo就是一个分页的Bean
            PageInfo pageInfo=new PageInfo(all);
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("orders-page-list");
            return mv;
        }
        @RequestMapping("findById.do")
        public ModelAndView findById(@RequestParam(name = "id" ,required = true) String id) throws Exception {
            System.out.println("***********************");
            System.out.println(id);
            ModelAndView mv =new ModelAndView();
            Orders byid = iOrdersService.findById(id);
            mv.addObject("orders",byid);
            mv.setViewName("orders-show");

            return mv;
        }

}
