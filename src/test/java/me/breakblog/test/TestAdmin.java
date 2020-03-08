package me.breakblog.test;

import me.breakblog.dao.AdminDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestAdmin {

    @Autowired
    private AdminDao adminDao;

    @Test
    public void Test() throws Exception {
        System.out.println(adminDao.hasAdmin("admin", "breakblog"));
    }
}