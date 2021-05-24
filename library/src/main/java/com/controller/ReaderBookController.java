package com.controller;

import com.dao.BookMapper;
import com.pojo.Book;
import com.pojo.Lend;
import com.pojo.ReaderCard;
import com.service.BookService;
import com.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReaderBookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private LendService lendService;

    @RequestMapping("/readerBooks")
    public String readerBooks(HttpSession session){
        ReaderCard readerCard=(ReaderCard) session.getAttribute("readerCard");
        long readerId= readerCard.getReaderId();
        List<Lend> lendList=lendService.queryLendById(readerId);
        List<Book> books=bookService.queryAllBook();
        session.setAttribute("books",books);
        session.setAttribute("lendList",lendList);
        session.removeAttribute("error");
        session.removeAttribute("succ");
        return "/readerBooks";
    }

    @RequestMapping("/ReaderQueryBook")
    public String ReaderQueryBook(String word,HttpSession session){
        List<Book> books=bookService.queryBook(word);
        if (books.size()>0){
            session.removeAttribute("error");
            session.setAttribute("succ","查找成功");
        }else {
            session.removeAttribute("succ");
            session.setAttribute("error","查找不到匹配的图书");
        }
        session.setAttribute("books",books);
        return "/readerBooks";
    }

    @RequestMapping("/readerBookDetail")
    public String readerBookDetail(HttpServletRequest request, HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        Book book=bookService.queryBookById(bookId);
        session.setAttribute("detail",book);
        return "/readerBookDetail";
    }

}
