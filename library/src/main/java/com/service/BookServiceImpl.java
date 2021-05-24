package com.service;

import com.dao.BookMapper;
import com.pojo.Book;

import java.util.List;

public class BookServiceImpl implements BookService{

    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper=bookMapper;
    }

    @Override
    public List<Book> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    @Override
    public List<Book> queryBook(String word) {
        return bookMapper.queryBook(word);
    }

    @Override
    public void deleteBookById(Long id) {
        bookMapper.deleteBookById(id);
    }

    @Override
    public Book queryBookById(Long id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }


}
