package com.erp.util;

public class Page {
	//每页显示数量
	private int limit;
	//页码
	private int page;
	//sql语句起始索引
	private int offset;
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
 
}