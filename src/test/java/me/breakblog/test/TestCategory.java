package me.breakblog.test;

import me.breakblog.dao.CategoryDao;
import me.breakblog.entity.Category;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestCategory {

    @Autowired
    private CategoryDao categoryDao;

    @Test
    public void TestFindAll() throws Exception {
        List<Category> categories = categoryDao.findAll();
        for (Category category : categories){
            System.out.println(category);
            System.out.println(category.getPosts().size());
        }
    }

    @Test
    public void TestFindByName() throws Exception {
        Category byName = categoryDao.findByName("default");
        System.out.println(byName);
    }

    @Test
    public void TestaddCategory() throws Exception {
        Category category = new Category();
        category.setName("test");
        int i = categoryDao.addCategory(category);
        System.out.println(i);
    }
}
