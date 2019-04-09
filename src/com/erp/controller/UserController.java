package com.erp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.IUserOperation;
import com.erp.model.Users;
import com.erp.util.JsonResult;
import com.erp.util.SplitPageResult;

@Controller
public class UserController {
    @Autowired
    IUserOperation userMapper;
   
    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String login() {
    	return "login";
    }
    
    @RequestMapping(value="/login",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult login(HttpServletRequest request){
    	JsonResult jr = new JsonResult();
    	String account = request.getParameter("account");
    	String password = request.getParameter("password");
    	Map<Object, Object> item = new HashMap<Object, Object>();
    	item.put("account", account);
    	item.put("password", password);
        Users users=userMapper.selectUserByAccountName(account); 
        if(users != null && users.getPassword().equals(password)) {
        	if(users.getUser_type().equals("0")) {
            	users.setUser_type("超级管理员");
            }else {
            	users.setUser_type("普通用户");
            }
        	HttpSession session = request.getSession();
        	//将数据存储到session中
        	session.setAttribute("account", account);
        	session.setAttribute("userType", users.getUser_type());
        	session.setAttribute("imgPath", users.getImgPath());
        	jr.setErrcode("200");
        	jr.setMessage("登录成功");
        	jr.setItem(item);
        }else {
        	jr.setErrcode("404");
        	jr.setMessage("登录失败");
        }
        return jr;
    }
    
    
    
    //展示页
    @RequestMapping(value="/showIndex",method = RequestMethod.GET)
    public String showIndex() {
    	return "showIndex";
    }
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession(false);
    	if(session == null) {
    		response.sendRedirect("login");
    		return null;
    	}else {
    		String loginName = (String)session.getAttribute("account");
        	if(loginName == null) {
        		response.sendRedirect("login");
        	}
    	}
    	return "index";
    }
    //loginout login_out
    @RequestMapping(value="/loginOut",method = RequestMethod.GET)
    public String login_out(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	session.invalidate();
    	return "login";
    }
    
    @RequestMapping(value="/userInfo",method = RequestMethod.GET)
    public String index_v1() {
    	return "userInfo";
    }
    
    //userTable展示
    @RequestMapping(value="/users",method = RequestMethod.POST)
    @ResponseBody
    public SplitPageResult<List<Users>> user_data(Users user_search,HttpServletRequest request) {
    	//获取参数
    	//String offset1 = request.getParameter("offset");
    	int offset = Integer.parseInt(request.getParameter("offset"));
    	int limit = Integer.parseInt(request.getParameter("limit"));
    	//判断是都有查询参数进来
    	Users if_users = user_search;
    	String userName = request.getParameter("userName");
    	String toSchoolNumber = request.getParameter("toSchoolNumber");
    	String user_type = request.getParameter("user_type");
    	List<Users> user_page;
    	int total;
    	if(userName != "" || toSchoolNumber != ""  || user_type != "") {
    		if_users.setUserName(userName);
    		if_users.setToSchoolNumber(toSchoolNumber);
    		if_users.setUser_type(user_type);
    		user_page = userMapper.selectByAny(offset,limit,userName,toSchoolNumber,user_type);
    		total = userMapper.selectTotalSearchCount(if_users);
    	}
    	//无查询参数查询数据
    	else{
    		user_page = userMapper.selectUsersListPage(offset,limit);
    		total = userMapper.selectTotalCount();
    	}
    	//返回数据
    	SplitPageResult<List<Users>> split_result = new SplitPageResult<List<Users>>();
    	
    	//修改数据库取出的时间数据带.0的问题
    	for(int i = 0; i < user_page.size(); i++) {
    		String date = user_page.get(i).getSubmission_date();
    		user_page.get(i).setSubmission_date(date.replace(".0", ""));
    	}
    	split_result.setPage(offset/limit+1);
    	split_result.setTotal(total);
    	split_result.setRows(user_page);
    	
		return split_result;
    }
    //userTable change data
    @RequestMapping(value="/update_user",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update_user(Users users,HttpServletRequest request) {
    	JsonResult jr = new JsonResult();
    	int id = Integer.parseInt(request.getParameter("id"));
    	users.setId(id);
    	int re = userMapper.updateUsers(users);
    	if(re == 1) {
    		jr.setErrcode("200");
    		jr.setMessage("用户数据修改成功");
    	}else {
    		jr.setErrcode("400");
    		jr.setMessage("用户数据修改失败");
    	}
		return jr;
    	
    }
    
    //userTable delete user
    @RequestMapping(value="/delete_user",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult delete_user(HttpServletRequest request) {
    	JsonResult jr = new JsonResult();
    	String id = request.getParameter("id");
    	String re = userMapper.deleteUserById(id);
    	if(re == null) {
    		jr.setErrcode("200");
    		jr.setMessage("删除成功");
    	}else {
    		jr.setErrcode("404");
    		jr.setMessage("删除失败");
    	}
		return jr;
    	
    }   
    
}