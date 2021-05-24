package com.dao;


import com.pojo.ReaderCard;
import com.pojo.ReaderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ReaderMapper {

    ReaderCard queryReaderById(long id);

    ReaderInfo queryReaderInfoById(long id);

    String queryUsernameById(long id);

    List<ReaderInfo> queryAllReader();

    void updateReader(ReaderInfo readerInfo);

    void updateReaderCard(ReaderCard readerCard);

    void deleteReaderById(long id);

    void deleteReaderCardById(long id);

    void addReader(ReaderInfo readerInfo);

    void addReaderCard(ReaderCard readerCard);

    String queryPasswordById(long id);

    void updatePassword(@Param("readerId") long id, @Param("newPasswd") String newPasswd);
}
