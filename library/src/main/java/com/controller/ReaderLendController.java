package com.controller;

import com.pojo.Lend;
import com.pojo.ReaderCard;
import com.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReaderLendController {

    @Autowired
    private LendService lendService;

    @RequestMapping("/myLend")
    public String myLend(HttpSession session){
        ReaderCard readerCard=(ReaderCard) session.getAttribute("readerCard");
        long readerId= readerCard.getReaderId();
        List<Lend> lendList=lendService.queryLendById(readerId);
        if (lendList==null){
            session.setAttribute("error","未找到借还记录！");
        }else {
            session.setAttribute("lendList",lendList);
            session.setAttribute("succ","查找成功！");
        }
        return "/readerLendList";
    }

    @RequestMapping("/returnBook")
    public String returnBook(HttpServletRequest request, HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        ReaderCard readerCard=(ReaderCard) session.getAttribute("readerCard");
        long readerId= readerCard.getReaderId();
        lendService.returnBook(readerId,bookId);
        return "redirect:/readerBooks";
    }

    @RequestMapping("/lendBook")
    public String lendBook(HttpServletRequest request, HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        ReaderCard readerCard=(ReaderCard) session.getAttribute("readerCard");
        long readerId= readerCard.getReaderId();
        lendService.lendBook(readerId,bookId);
        return "redirect:/readerBooks";
    }
}