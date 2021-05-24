package com.controller;

import com.pojo.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminRepasswd")
    public String adminRepasswd(HttpSession session){
        session.removeAttribute("error");
        return "/adminRepasswd";
    }

    @RequestMapping("/adminrRepasswdDo")
    public String adminrRepasswdDo(@RequestParam(value = "oldPasswd") String oldPasswd,String newPasswd, HttpSession session, HttpServletRequest request){
        long adminId=Long.parseLong(request.getParameter("adminId"));
        String oldPassword=adminService.queryPasswordById(adminId);
        if (!oldPassword.equals(oldPasswd)){
            session.setAttribute("error","旧密码错误，请重新输入");
            return "/adminRepasswd";
        }else {
            if (oldPasswd.equals(newPasswd)){
                session.setAttribute("error","新密码不能与旧密码相同");
                return "/adminRepasswd";
            }else {
                adminService.updatePassword(adminId,newPasswd);
                session.setAttribute("succ","密码修改成功，请重新登录");
                return "/login";
            }
        }
    }
}
