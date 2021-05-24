package com.service;

import com.pojo.Lend;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LendService {

    List<Lend> queryAllLend();

    void deleteLendById(long id);

    List<Lend> queryLendById(long id);

    void returnBook(@Param("readerId") long readerId, @Param("bookId") long bookId);

    void lendBook(@Param("readerId") long readerId, @Param("bookId") long bookId);
}
