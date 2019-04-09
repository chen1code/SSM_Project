package com.erp.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erp.model.News;

public interface NewsOperation {
	
	//add news
	public int addNews(News news);
	//查询总数
	public int selectNewsTotalCount();
	//分页查询
	public List<News> selectNewsListPage(@Param("offset") int offset, @Param("limit") int limit);
	//修改
	public int updateNews(News news);
	//删除
	public String deleteNewsById(String id);
	
}
