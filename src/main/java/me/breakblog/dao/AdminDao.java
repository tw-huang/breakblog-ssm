package me.breakblog.dao;

import me.breakblog.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    Admin findAdmin();

    Admin hasAdmin(@Param("username") String username, @Param("password") String password);

    int updateAdmin(Admin admin);
}
