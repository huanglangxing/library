package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReaderCard implements Serializable {
    private long readerId;//id
    private String username;//用户名
    private String password;//密码
}
