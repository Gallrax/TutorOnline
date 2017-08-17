package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/4/27.
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/login")
	public boolean login(String username, String password, HttpSession session) {
		User user = userService.selectOne(new EntityWrapper<User>().eq("username", username).eq("password", password));
//		User user = (User) userService.selectObj(new EntityWrapper<User>().eq("username", username).eq("password", password));
		if (user == null) return false;
		session.setAttribute("user", user);
		return true;
	}

	@ResponseBody
	@RequestMapping("/regist")
	public String regist(String username, String password, Integer isTea, HttpSession session) {
		User user = (User) userService.selectObj(new EntityWrapper<User>().eq("username", username));
		if (user != null) return "no";
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setIsTea(isTea);
		userService.insert(u);
		session.setAttribute("user", u);
		return "yes";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("user", null);
		return "index";
	}

	@ResponseBody
	@RequestMapping("/getUserById")
	public User getUserById(Integer id) {
		User user = userService.selectById(id);
		return user;
	}

	@ResponseBody
	@RequestMapping("/getTeachers")
	public List<User> getTeachers(Integer index) {
		List<User> users = userService.selectPage(new Page<User>(index, 3), new EntityWrapper<User>().eq("isTea", 1)).getRecords();
		return users;
	}

	@ResponseBody
	@RequestMapping("/getPage")
	public Integer getPage(String field, String value) {
		int i = userService.selectCount(new EntityWrapper<User>().eq(field, value));
		int count = (i % 3) == 0 ? (i / 3) : (i / 3) + 1;
		if(count == 0) count = 1;
		return count;
	}

	@RequestMapping("/updateUser")
	public String updateUser(User user) {
		userService.updateById(user);
		return "index";
	}

}
