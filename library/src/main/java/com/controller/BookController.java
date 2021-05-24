package com.controller;

import com.pojo.Book;
import com.service.BookService;
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
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/adminBooks")
    public String adminBooks(HttpSession session){
        List<Book> books=bookService.queryAllBook();
        session.setAttribute("books",books);
        session.removeAttribute("error");
        session.removeAttribute("succ");
        return "/adminBooks";
    }

    @RequestMapping("/queryBook")
    public String queryBook(String word,HttpSession session){
        List<Book> books=bookService.queryBook(word);
        if (books.size()>0){
            session.removeAttribute("error");
            session.setAttribute("succ","查找成功");
        }else {
            session.removeAttribute("succ");
            session.setAttribute("error","查找不到匹配的图书");
        }
        session.setAttribute("books",books);
        return "/adminBooks";
    }

    @RequestMapping("/deleteBook")
    public String deleteBook(HttpServletRequest request,HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        bookService.deleteBookById(bookId);
        session.setAttribute("succ","删除成功");
        List<Book> books=bookService.queryAllBook();
        session.setAttribute("books",books);
        return "/adminBooks";
    }

    @RequestMapping("/adminBookDetail")
    public String adminBookDetail(HttpServletRequest request,HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        Book book=bookService.queryBookById(bookId);
        session.setAttribute("detail",book);
        return "/adminBookDetail";
    }

    @RequestMapping("/updateBook")
    public String updateBook(HttpServletRequest request,HttpSession session){
        long bookId=Long.parseLong(request.getParameter("bookId"));
        Book book=bookService.queryBookById(bookId);
        session.setAttribute("detail",book);
        return "/adminBookEdit";
    }

    private Date getDate(String pubstr) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.parse(pubstr);
        } catch (ParseException e) {
            e.printStackTrace();
            return new Date();
        }
    }

    @RequestMapping("/bookUpdateDo")
    public String bookEditDo(@RequestParam(value = "pubstr") String pubstr,HttpSession session,Book book){
        if(book!=null){
            book.setPubDate(getDate(pubstr));
            bookService.updateBook(book);
            session.setAttribute("succ","修改成功！");
            List<Book> books=bookService.queryAllBook();
            session.setAttribute("books",books);
        }else {
            session.setAttribute("error","修改失败！");
        }
        return "/adminBooks";
    }

    @RequestMapping("/bookAdd")
    public String bookAdd(){
        return "adminBookAdd";
    }

    @RequestMapping("/bookAddDo")
    public String bookAddDo(@RequestParam(value = "pubstr") String pubstr,HttpSession session,Book book){
        if (book!=null){
            book.setPubDate(getDate(pubstr));
            bookService.addBook(book);
            session.setAttribute("succ","添加成功！");
            List<Book> books=bookService.queryAllBook();
            session.setAttribute("books",books);
        }else {
            session.setAttribute("error","添加失败！");
        }
        return "/adminBooks";
    }
}
