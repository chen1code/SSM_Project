package com.erp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.IUserOperation;
import com.erp.model.Users;
import com.erp.util.JsonResult;

@Controller
public class UploadFileController {
	
	@Autowired
	IUserOperation userMapper;
	
	//上传头像
	@RequestMapping(value="/uploadImg",method = RequestMethod.GET)
    public String uploadHeadImg() {
    	return "uploadImg";
    }
	
	@RequestMapping(value="/uploadImg",method = RequestMethod.POST)
	@ResponseBody
    public JsonResult uploadImg(HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		String imgPath = request.getParameter("imgPath");
		String account = request.getParameter("account");
		//int re = userMapper.updateImg(imgPath, account);
		int re = 1;
		if(re == 1) {
    		jr.setErrcode("200");
    		jr.setMessage("头像上传成功");
    	}else {
    		jr.setErrcode("400");
    		jr.setMessage("头像上传失败");
    	}
    	return jr;
    }
	
	//test
	@RequestMapping("/upload")  
    public String upload(Users user,HttpServletRequest request,Model model) throws Exception{  
    System.out.println(request.getParameter("name"));  
      //保存数据库的路径  
      String sqlPath = null;   
      //定义文件保存的本地路径  
      String localPath="/Users/wangchen/Downloads/headPic⁩";  
      //定义 文件名  
      String filename=null;    
      if(!user.getFile().isEmpty()){    
          //生成uuid作为文件名称    
          String uuid = UUID.randomUUID().toString().replaceAll("-","");    
          //获得文件类型（可以判断如果不是图片，禁止上传）    
          String contentType=user.getFile().getContentType();    
          //获得文件后缀名   
          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
          //得到 文件名  
          filename=uuid+"."+suffixName;   
          System.out.println(filename);  
          //文件保存路径  
          user.getFile().transferTo(new File(localPath+filename));    
      }  
      //把图片的相对路径保存至数据库  
      sqlPath = "/images/"+filename;  
      System.out.println(sqlPath);  
      user.setImgPath(sqlPath);  
      userMapper.updateImg(user);  
      model.addAttribute("user", user);  
      return "uploadImg";  
    }  


}
