package me.breakblog.test;

import me.breakblog.dao.LinkDao;
import me.breakblog.entity.Link;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestLink {

    @Autowired
    private LinkDao linkDao;

    @Test
    public void TestFindAll() throws Exception {
        List<Link> links = linkDao.findAll();
        for (Link link : links) System.out.println(link);
    }

    @Test
    public void TestAddLink() throws Exception {
        Link link = new Link();
        link.setName("github");
        link.setUrl("https://github.com/");
        int i = linkDao.addLink(link);
        System.out.println(i);
    }

    @Test
    public void TestUpdateLink() throws Exception {
        Link link = new Link();
        link.setId(1);
        link.setName("breakblog");
        link.setUrl("https://www.breakblog.me/");
        int i = linkDao.updateLink(link);
        System.out.println(i);
    }
}
