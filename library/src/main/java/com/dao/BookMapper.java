package com.dao;

import com.pojo.Book;

import java.util.List;

public interface BookMapper {

    List<Book> queryAllBook();

    List<Book> queryBook(String word);

    Book queryBookById(Long id);

    void deleteBookById(Long id);

    void updateBook(Book book);

    void addBook(Book book);
}
