package com.service;

import com.dao.LendMapper;
import com.dao.ReaderMapper;
import com.pojo.Lend;
import com.pojo.ReaderCard;
import com.pojo.ReaderInfo;

import java.util.Date;
import java.util.List;

public class LendServiceImpl implements LendService {

    private LendMapper lendMapper;

    public void setLendMapper(LendMapper lendMapper) {
        this.lendMapper = lendMapper;
    }

    @Override
    public List<Lend> queryAllLend() {
        return lendMapper.queryAllLend();
    }

    @Override
    public void deleteLendById(long id) {
        lendMapper.deleteLendById(id);
    }

    @Override
    public List<Lend> queryLendById(long id) {
        return lendMapper.queryLendById(id);
    }

    @Override
    public void returnBook(long readerId, long bookId) {
        Date backDate=new Date();
        lendMapper.returnBook(readerId,bookId,backDate);
        lendMapper.returnBook1(bookId);
    }

    @Override
    public void lendBook(long readerId, long bookId) {
        Date lendDate=new Date();
        lendMapper.lendBook(readerId,bookId,lendDate);
        lendMapper.lendBook1(bookId);
    }


}
