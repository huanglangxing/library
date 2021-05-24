package com.controller;

import com.pojo.Lend;
import com.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LendController {

    @Autowired
    private LendService lendService;

    @RequestMapping("/lendList")
    public String lendList(HttpSession session){
        List<Lend> lends=lendService.queryAllLend();
        session.setAttribute("lends",lends);
        session.removeAttribute("succ");
        return "/adminLendList";
    }

    @RequestMapping("/deleteLend")
    public String deleteLend(HttpSession session, HttpServletRequest request){
        long serNum=Long.parseLong(request.getParameter("serNum"));
        lendService.deleteLendById(serNum);
        List<Lend> lends=lendService.queryAllLend();
        session.setAttribute("succ","删除成功");
        session.setAttribute("lends",lends);
        return "/adminLendList";
    }
}
