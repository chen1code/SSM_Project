package com.erp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.inter.NewsOperation;
import com.erp.model.News;
import com.erp.util.JsonResult;
import com.erp.util.SplitPageResult;


@Controller
public class NewsController {
	@Autowired
    NewsOperation newsMapper;
	
	@RequestMapping(value="/newsPublish",method = RequestMethod.GET)
    public String newsPublish() {
    	return "newsPublish";
    }
	@RequestMapping(value="/newsPublish",method = RequestMethod.POST)
	@ResponseBody
    public JsonResult newsPublish(News news, HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		//获取发布时间
		Date date = new Date();
		DateFormat df = DateFormat.getDateTimeInstance();
		news.setPublish_date(df.format(date));
		int add_news_re = newsMapper.addNews(news);
		if(add_news_re == 1) {
			jr.setErrcode("200");
			jr.setMessage("新闻发布成功");
		}else {
			jr.setErrcode("404");
			jr.setMessage("新闻发布失败");
		}
    	return jr;
    }
	//新闻分页
	@RequestMapping(value="/newsList",method = RequestMethod.GET)
    public String newsList() {
    	return "newsList";
    }
	@RequestMapping(value="/news",method = RequestMethod.GET)
	@ResponseBody
	public SplitPageResult<List<News>> newsList(HttpServletRequest request) {
    	//获取参数
    	int offset = Integer.parseInt(request.getParameter("offset"));
    	int limit = Integer.parseInt(request.getParameter("limit"));
    	//查询数据
    	List<News> news_list = newsMapper.selectNewsListPage(offset,limit);
    	//返回数据
    	SplitPageResult<List<News>> split_result = new SplitPageResult<List<News>>();
    	int total = newsMapper.selectNewsTotalCount();
    	//修改数据库取出的时间数据带.0的问题
    	for(int i = 0; i < news_list.size(); i++) {
    		String date = news_list.get(i).getPublish_date();
    		news_list.get(i).setPublish_date(date.replace(".0", ""));
    	}
    	split_result.setPage(offset/limit+1);
    	split_result.setTotal(total);
    	split_result.setRows(news_list);
    	
		return split_result;
    }
	//更新新闻
	@RequestMapping(value="/updateNews",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult updateNews(News news, HttpServletRequest request) {
		JsonResult jr = new JsonResult();
		Date date = new Date();
		DateFormat df = DateFormat.getDateTimeInstance();
		int id = Integer.parseInt(request.getParameter("id"));
		news.setId(id);
		news.setPublish_date(df.format(date));
		int update_re = newsMapper.updateNews(news);
		if(update_re == 1) {
			jr.setErrcode("200");
			jr.setMessage("修改成功");
		}
		return jr;
		
	}
	//删除新闻
	@RequestMapping(value="/deleteNews",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult deleteNews(HttpServletRequest request) {
    	JsonResult jr = new JsonResult();
    	String id = request.getParameter("id");
    	String re = newsMapper.deleteNewsById(id);
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
