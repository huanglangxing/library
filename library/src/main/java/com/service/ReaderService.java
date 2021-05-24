package com.service;

import com.pojo.Admin;
import com.pojo.ReaderCard;
import com.pojo.ReaderInfo;

import java.util.List;

public interface ReaderService {
    //根据id查询,返回一个admin
    ReaderCard queryReaderById(long id);

    ReaderInfo queryReaderInfoById(long id);

    String queryUsernameById(long id);

    List<ReaderInfo> queryAllReader();

    void updateReader(ReaderInfo readerInfo);

    void updateReaderCard(ReaderCard readerCard);

    void addReader(ReaderInfo readerInfo);

    void addReaderCard(ReaderCard readerCard);

    void deleteReaderById(long id);

    void deleteReaderCardById(long id);

    String queryPasswordById(long id);

    void updatePassword(long id,String newPasswd);
}
