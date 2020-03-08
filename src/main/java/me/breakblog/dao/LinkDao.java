package me.breakblog.dao;

import me.breakblog.entity.Link;

import java.util.List;


public interface LinkDao {

    List<Link> findAll();

    Link findById(int id);

    int addLink(Link link);

    int updateLink(Link link);

    int deleteLink(Integer id);
}
