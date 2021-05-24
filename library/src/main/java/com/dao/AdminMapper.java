package com.dao;

import com.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    Admin queryAdminById(long id);

    String queryUsernameById(long id);

    String queryPasswordById(long id);

    void updatePassword(@Param("adminId") long id,@Param("newPasswd") String newPasswd);
}
