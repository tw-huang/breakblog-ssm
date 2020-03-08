package me.breakblog.controller;

import com.github.pagehelper.PageInfo;
import me.breakblog.entity.Category;
import me.breakblog.entity.Post;
import me.breakblog.service.CategoryService;
import me.breakblog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class PostController {
    private PostService postService;
    private CategoryService categoryService;

    @Autowired
    public PostController(PostService postService, CategoryService categoryService) {
        this.postService = postService;
        this.categoryService = categoryService;
    }

    @RequestMapping(value = "/post/new", method = RequestMethod.GET)
    public String newPostGet(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "admin/newpost";
    }

    @RequestMapping(value = "/post/new", method = RequestMethod.POST)
    public String newPostPost(Post post, Model model) {
        post.setTimestamp(new Timestamp(new java.util.Date().getTime()));
        int i = postService.addPost(post);
        if (i == 1) return "redirect:/admin/post/manage";
        model.addAttribute("msg", "New Post Error！");
        return "forward:/admin/post/manage";
    }

    @RequestMapping(value = "/post/edit/{id}", method = RequestMethod.GET)
    public String editPostGet(@PathVariable("id") int id, Model model) {
        Post post = postService.findById(id);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("post", post);
        model.addAttribute("categories", categories);
        return "admin/editpost";
    }

    @RequestMapping(value = "/post/edit/{id}", method = RequestMethod.POST)
    public String editPostPost(@PathVariable("id") int id, Post post, Model model) {
        int i = postService.updatePost(post);
        if (i == 1) return "redirect:/admin/post/manage";
        model.addAttribute("msg", "Edit Post Error！");
        return "forward:/admin/post/manage";
    }

    @RequestMapping(value = "/post/delete/{id}", method = RequestMethod.POST)
    public String deletePostPost(@PathVariable("id") int id, Model model) {
        int i = postService.deletePost(id);
        if (i == 1) return "redirect:/admin/post/manage";
        model.addAttribute("msg", "Delete Error！");
        return "forward:/admin/post/manage";
    }

    @RequestMapping(value = "/post/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public String managePost(@RequestParam(name = "page", required = true, defaultValue = "1") int page,
                             @RequestParam(name = "size", required = true, defaultValue = "10") int size, Model model) {
        List<Post> posts = postService.findAll(page, size);
        PageInfo<Post> pageInfo = new PageInfo<>(posts);
        model.addAttribute("posts", posts);
        model.addAttribute("page", pageInfo);
        return "admin/managepost";
    }
}
