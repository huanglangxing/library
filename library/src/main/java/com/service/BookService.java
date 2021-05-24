package com.service;

import com.pojo.Book;

import java.util.List;

public interface BookService {
    List<Book> queryAllBook();

    List<Book> queryBook(String word);

    void deleteBookById(Long id);

    Book queryBookById(Long id);

    void updateBook(Book book);

    void addBook(Book book);
}
