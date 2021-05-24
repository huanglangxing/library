package com.controller;

import com.alibaba.fastjson.JSON;
import com.pojo.Admin;
import com.pojo.ReaderCard;
import com.service.AdminService;
import com.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private ReaderService readerService;

    @RequestMapping(value = {"/", "/login"})
    public String toLogin(HttpServletRequest request) {
        request.getSession().invalidate();
        return "/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/login";
    }

    @RequestMapping(value = "/api/loginCheck" , method = RequestMethod.POST ,produces = "application/json;charset=utf-8")
    public @ResponseBody
    Object loginCheck(HttpServletRequest request, HttpSession session) {
        long id = Long.parseLong(request.getParameter("id"));
        String passwd = request.getParameter("passwd");
        Admin admin=adminService.queryAdminById(id);
        ReaderCard readerCard=readerService.queryReaderById(id);
        String username;
        Map<String, String> res = new HashMap<>();
        if (admin!=null&&admin.getPassword().equals(passwd)){
            username=adminService.queryUsernameById(id);
            admin.setUsername(username);
            session.setAttribute("admin",admin);
            session.setAttribute("loginUser",username);
            res.put("stateCode", "1");
            res.put("msg", "管理员登陆成功！");
        }else if (readerCard!=null&&readerCard.getPassword().equals(passwd)){
            username=readerService.queryUsernameById(id);
            readerCard.setUsername(username);
            session.setAttribute("readerCard",readerCard);
            session.setAttribute("loginUser",username);
            res.put("stateCode", "2");
            res.put("msg", "读者登陆成功！");
        }else {
            res.put("stateCode", "0");
            res.put("msg", "账号或密码错误！");
        }
        return JSON.toJSONString(res);
    }

    @RequestMapping(value = {"/adminMain"})
    public String toAdminMain() {
        return "/adminMain";
    }

    @RequestMapping(value = {"/readerMain"})
    public String toReaderMain() {
        return "/readerMain";
    }

    @RequestMapping("/adminHeader")
    public String adminHeader(){
        return "/adminHeader";
    }

    @RequestMapping("/readerHeader")
    public String readerHeader(){
        return "/readerHeader";
    }
}
