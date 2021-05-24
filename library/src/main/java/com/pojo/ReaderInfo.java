package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReaderInfo implements Serializable {
    private long readerId;//id
    private String name;//名字
    private String sex;//性别
    private Date birth;//生日
    private String address;//地址
    private String phone;//电话
}
