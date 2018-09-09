package com.mishop.entity;

import java.util.List;

public class Page<T> {
	//当前页面，默认为第一页
	private int currentPage=1;
	//每页显示的数据数（即数据库里的每一行数据）
	private int pageCount=3;
	//总记录
	private int totalCount;
	//总的页数
	private int totalPage;
	//分页查询到的数据
	private List<T> pageData;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		if(totalCount%pageCount==0) {
			totalPage=totalCount/pageCount;
		}else {
			totalPage=totalCount/pageCount+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

	
}
