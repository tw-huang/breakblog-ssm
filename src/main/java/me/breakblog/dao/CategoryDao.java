package me.breakblog.dao;

import me.breakblog.entity.Category;

import java.util.List;


public interface CategoryDao {

    List<Category> findAll();

    Category findById(int id);

    int addCategory(Category category);

    int updateCategory(Category category);

    int deleteCategory(int id);

    Category findByName(String name);

}
