package com.dao;

import com.pojo.Lend;
import com.pojo.ReaderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LendMapper {

    List<Lend> queryAllLend();

    void deleteLendById(long id);

    List<Lend> queryLendById(long id);

    void returnBook(@Param("readerId") long readerId, @Param("bookId") long bookId,@Param("backDate") Date backDate);

    void returnBook1(@Param("bookId") long bookId);

    void lendBook(@Param("readerId") long readerId, @Param("bookId") long bookId,@Param("lendDate") Date lendDate);

    void lendBook1(@Param("bookId") long bookId);
}
