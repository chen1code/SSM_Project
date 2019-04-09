package com.erp.controller;

import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.IUserOperation;
import com.erp.model.Users;
import com.erp.util.JsonResult;

@Controller
public class RegistController {
	@Autowired
    IUserOperation userMapper;
	
	
	@RequestMapping(value="/regist",method = RequestMethod.GET)
    public String regist() {
    	return "regist";
    }
    
    @RequestMapping(value="/regist",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult regist(HttpServletRequest request){
    	Date date = new Date();
    	JsonResult jr = new JsonResult();
    	Users users1 = new Users();
    	Users users2 = new Users();
    	DateFormat df = DateFormat.getDateTimeInstance();
    	String account = request.getParameter("account");
    	String password = request.getParameter("password");
    	users2 = userMapper.selectUserByAccountName(account);
    	if(users2 != null) {
    		jr.setErrcode("200");
        	jr.setMessage("该用户已注册");
    	}else {
    		users1.setAccount(account);
        	users1.setPassword(password);
        	//默认为普通用户
        	users1.setUser_type("1");
        	//
        	users1.setToSchoolNumber("000");
        	users1.setSubmission_date(df.format(date));
        	int re =  userMapper.addUsers(users1); 
            if(re == 1) {
            	jr.setErrcode("200");
            	jr.setMessage("注册成功");
            }else {
            	jr.setErrcode("404");
            	jr.setMessage("注册失败");
            }
    	}
        return jr;
    }
}
