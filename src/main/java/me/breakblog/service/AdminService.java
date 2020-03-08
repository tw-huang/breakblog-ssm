package me.breakblog.service;

import me.breakblog.entity.Admin;

public interface AdminService {

    Admin findAdmin();

    Admin hasAdmin(String username, String password);

    int updateAdmin(Admin admin);
}
