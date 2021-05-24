package com.service;

import com.pojo.Admin;

public interface AdminService {
    //根据id查询,返回一个admin
    Admin queryAdminById(long id);

    String queryUsernameById(long id);

    String queryPasswordById(long id);

    void updatePassword(long id,String newPasswd);
}
