package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin implements Serializable {
    private long adminId;//id
    private String password;//密码
    private String username;//用户名
}
