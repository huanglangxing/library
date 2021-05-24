package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book implements Serializable {
    private long bookId;//id
    private String name;//书名
    private String author;//作者
    private String publish;//出版
    private String ISBN;//编号
    private String introduction;//介绍
    private String language;//语言
    private BigDecimal price;//价格
    private Date pubDate;//出版时间
    private int classId;//类别id
    private int number;//数量
}
