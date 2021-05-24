package com.controller;

import com.pojo.Book;
import com.pojo.ReaderCard;
import com.pojo.ReaderInfo;
import com.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ReaderController {

    @Autowired
    private ReaderService readerService;

    @RequestMapping("/allReaders")
    public String allReaders(HttpSession session){
        List<ReaderInfo> readers=readerService.queryAllReader();
        session.setAttribute("readers",readers);
        session.removeAttribute("succ");
        return "/adminReaders";
    }

    @RequestMapping("/addReader")
    public String addReader(){
        return "adminReaderAdd";
    }

    private Date getDate(String str) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
            return new Date();
        }
    }

    @RequestMapping("/readerAddDo")
    public String readerAddDo(@RequestParam(value = "birstr") String birstr,@RequestParam(value = "password") String password,HttpSession session, ReaderInfo readerInfo){
        if(readerInfo!=null){
            readerInfo.setBirth(getDate(birstr));
            readerService.addReader(readerInfo);
            ReaderCard readerCard=new ReaderCard();
            readerCard.setReaderId(readerInfo.getReaderId());
            readerCard.setUsername(readerInfo.getName());
            readerCard.setPassword(password);
            readerService.addReaderCard(readerCard);
            session.setAttribute("succ","添加成功");
            List<ReaderInfo> readers=readerService.queryAllReader();
            session.setAttribute("readers",readers);
        }else {
            session.setAttribute("error","添加失败！");
        }
        return "/adminReaders";
    }

    @RequestMapping("/readerDelete")
    public String readerDelete(HttpSession session, HttpServletRequest request){
        long readerId=Long.parseLong(request.getParameter("readerId"));
        readerService.deleteReaderById(readerId);
        readerService.deleteReaderCardById(readerId);
        session.setAttribute("succ","删除成功");
        List<ReaderInfo> readers=readerService.queryAllReader();
        session.setAttribute("readers",readers);
        return "/adminReaders";
    }

    @RequestMapping("/readerEdit")
    public String readerEdit(HttpSession session, HttpServletRequest request){
        long readerId=Long.parseLong(request.getParameter("readerId"));
        ReaderInfo readerInfo=readerService.queryReaderInfoById(readerId);
        session.setAttribute("readerInfo",readerInfo);
        return "/adminReaderEdit";
    }

    @RequestMapping("/readerEditDo")
    public String readerEditDo(@RequestParam(value = "birstr") String birstr,HttpSession session, ReaderInfo readerInfo){
        if (readerInfo!=null){
            readerInfo.setBirth(getDate(birstr));
            readerService.updateReader(readerInfo);
            ReaderCard readerCard=readerService.queryReaderById(readerInfo.getReaderId());
            readerCard.setUsername(readerInfo.getName());
            readerService.updateReaderCard(readerCard);
            session.setAttribute("succ","修改成功！");
            List<ReaderInfo> readers=readerService.queryAllReader();
            session.setAttribute("readers",readers);
        }else {
            session.setAttribute("error","修改失败！");
        }
        return "/adminReaders";
    }

    @RequestMapping("/readerRepasswd")
    public String readerRepasswd(HttpSession session){
        session.removeAttribute("error");
        return "/readerRepasswd";
    }

    @RequestMapping("/readerRepasswdDo")
    public String readerRepasswdDo(@RequestParam(value = "oldPasswd") String oldPasswd,String newPasswd, HttpSession session, HttpServletRequest request){
        long readerId=Long.parseLong(request.getParameter("readerId"));
        String oldPassword=readerService.queryPasswordById(readerId);
        if (!oldPassword.equals(oldPasswd)){
            session.setAttribute("error","旧密码错误，请重新输入");
            return "/adminRepasswd";
        }else {
            if (oldPasswd.equals(newPasswd)){
                session.setAttribute("error","新密码不能与旧密码相同");
                return "/adminRepasswd";
            }else {
                readerService.updatePassword(readerId,newPasswd);
                session.setAttribute("succ","密码修改成功，请重新登录");
                return "/login";
            }
        }
    }

    @RequestMapping("/readerInfo")
    public String readerInfo(HttpSession session){
        ReaderCard readerCard=(ReaderCard) session.getAttribute("readerCard");
        long readerId= readerCard.getReaderId();
        ReaderInfo readerInfo=readerService.queryReaderInfoById(readerId);
        session.setAttribute("readerInfo",readerInfo);
        return "/readerInfo";
    }

    @RequestMapping("/readerInfoEdit")
    public String readerInfoEdit(){
        return "/readerInfoEdit";
    }
}
