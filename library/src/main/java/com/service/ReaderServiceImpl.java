package com.service;

import com.dao.AdminMapper;
import com.dao.ReaderMapper;
import com.pojo.Admin;
import com.pojo.ReaderCard;
import com.pojo.ReaderInfo;

import java.util.List;

public class ReaderServiceImpl implements ReaderService {

    private ReaderMapper readerMapper;

    public void setReaderMapper(ReaderMapper readerMapper) {
        this.readerMapper = readerMapper;
    }

    @Override
    public ReaderCard queryReaderById(long id) {
        return readerMapper.queryReaderById(id);
    }

    @Override
    public ReaderInfo queryReaderInfoById(long id) {
        return readerMapper.queryReaderInfoById(id);
    }

    @Override
    public String queryUsernameById(long id) {
        return readerMapper.queryUsernameById(id);
    }

    @Override
    public List<ReaderInfo> queryAllReader() {
        return readerMapper.queryAllReader();
    }

    @Override
    public void updateReader(ReaderInfo readerInfo) {
        readerMapper.updateReader(readerInfo);
    }

    @Override
    public void updateReaderCard(ReaderCard readerCard) {
        readerMapper.updateReaderCard(readerCard);
    }

    @Override
    public void addReader(ReaderInfo readerInfo) {
        readerMapper.addReader(readerInfo);
    }

    @Override
    public void addReaderCard(ReaderCard readerCard) {
        readerMapper.addReaderCard(readerCard);
    }

    @Override
    public void deleteReaderById(long id) {
        readerMapper.deleteReaderById(id);
    }

    @Override
    public void deleteReaderCardById(long id) {
        readerMapper.deleteReaderCardById(id);
    }

    @Override
    public String queryPasswordById(long id) {
        return readerMapper.queryPasswordById(id);
    }

    @Override
    public void updatePassword(long id,String newPasswd) {
        readerMapper.updatePassword(id,newPasswd);
    }
}
