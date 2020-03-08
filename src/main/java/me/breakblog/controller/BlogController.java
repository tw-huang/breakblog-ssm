package me.breakblog.controller;

import com.github.pagehelper.PageInfo;
import me.breakblog.entity.Admin;
import me.breakblog.entity.Category;
import me.breakblog.entity.Link;
import me.breakblog.entity.Post;
import me.breakblog.service.AdminService;
import me.breakblog.service.CategoryService;
import me.breakblog.service.LinkService;
import me.breakblog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BlogController {
    private LinkService linkService;
    private CategoryService categoryService;
    private PostService postService;
    private AdminService adminService;

    @Autowired
    public BlogController(LinkService linkService, CategoryService categoryService, PostService postService, AdminService adminService) {
        this.linkService = linkService;
        this.categoryService = categoryService;
        this.postService = postService;
        this.adminService = adminService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "10") int size, Model model) {
        List<Link> links = linkService.findAll();
        List<Category> categories = categoryService.findAll();
        List<Post> posts = postService.findAll(page, size);
        PageInfo<Post> pageInfo = new PageInfo<>(posts);
        Admin admin = adminService.findAdmin();
        model.addAttribute("links", links);
        model.addAttribute("categories", categories);
        model.addAttribute("posts", posts);
        model.addAttribute("page", pageInfo);
        model.addAttribute("admin", admin);
        return "blog/index";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model model) {
        List<Link> links = linkService.findAll();
        List<Category> categories = categoryService.findAll();
        Admin admin = adminService.findAdmin();
        model.addAttribute("links", links);
        model.addAttribute("categories", categories);
        model.addAttribute("admin", admin);
        return "blog/about";
    }

    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
    public String post(@PathVariable("id") int id, Model model) {
        List<Link> links = linkService.findAll();
        List<Category> categories = categoryService.findAll();
        Post post = postService.findById(id);
        Admin admin = adminService.findAdmin();
        model.addAttribute("links", links);
        model.addAttribute("categories", categories);
        model.addAttribute("post", post);
        model.addAttribute("admin", admin);
        return "blog/post";
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    public String category(
            @PathVariable("id") int id,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "10") int size, Model model) {
        List<Link> links = linkService.findAll();
        List<Category> categories = categoryService.findAll();
        List<Post> posts = postService.findByCategoryId(id, page, size);
        PageInfo<Post> pageInfo = new PageInfo<>(posts);
        Category categoryById = categoryService.findById(id);
        Admin admin = adminService.findAdmin();
        model.addAttribute("links", links);
        model.addAttribute("categories", categories);
        model.addAttribute("posts", posts);
        model.addAttribute("page", pageInfo);
        model.addAttribute("admin", admin);
        model.addAttribute("categoryById", categoryById);
        return "blog/category";
    }

    @RequestMapping(value = "/admin/login", method = RequestMethod.GET)
    public String login() {
        return "blog/login";
    }
}

