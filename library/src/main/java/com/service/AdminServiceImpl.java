package com.service;

import com.dao.AdminMapper;
import com.pojo.Admin;

public class AdminServiceImpl implements AdminService {

    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin queryAdminById(long id) {
        return adminMapper.queryAdminById(id);
    }

    @Override
    public String queryUsernameById(long id) {
        return adminMapper.queryUsernameById(id);
    }

    @Override
    public String queryPasswordById(long id) {
        return adminMapper.queryPasswordById(id);
    }

    @Override
    public void updatePassword(long id,String newPasswd) {
        adminMapper.updatePassword(id,newPasswd);
    }
}
