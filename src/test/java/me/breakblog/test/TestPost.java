package me.breakblog.test;

import me.breakblog.dao.PostDao;
import me.breakblog.entity.Post;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestPost {

    @Autowired
    private PostDao postDao;

    @Test
    public void TestFindAll() throws Exception {
        List<Post> posts = postDao.findAll();
        for (Post post : posts) {
            System.out.println(post.getTimestamp()+"---"+post.getTimestampFormat());
        }
    }

    @Test
    public void TestAddPost() throws Exception {
        Post post = new Post();
        post.setTitle("test");
        post.setSubtitle("test");
        post.setBody("test");
        post.setCategory_id(1);
        post.setTimestamp(new Timestamp(new java.util.Date().getTime()));
        int i = postDao.addPost(post);
        System.out.println(i);
    }

}
