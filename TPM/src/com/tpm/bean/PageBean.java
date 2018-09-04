package com.tpm.bean;

import java.util.ArrayList;
import java.util.List;

public class PageBean {

	private int pageNow; // 当前页
	private int pageSize = 10; // 每页显示多少条记录
	private int totalPage; // 共有多少页
	private int totalSize; // 共有多少条记录
	private boolean hasFirst; // 是否有首页
	private boolean hasPre; // 是否有前一页
	private boolean hasNext; // 是否有下一页
	private boolean hasLast; // 是否有最后一页
	private List<String> pageNumber;

	public PageBean(int pageNow, int totalSize) {
		this.pageNow = pageNow;
		this.totalSize = totalSize;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		totalPage = getTotalSize() / getPageSize();
		if (totalSize % pageSize != 0)
			totalPage++;
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public boolean isHasFirst() {
		if (pageNow == 1)
			return false;
		else
			return true;
	}

	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	public boolean isHasPre() {
		if (pageNow == 1)
			return false;
		else
			return true;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		if (pageNow == this.getTotalPage())
			return false;
		else
			return true;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public boolean isHasLast() {
		if (pageNow == this.getTotalPage())
			return false;
		else
			return true;
	}

	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}

	public List<String> getPageNumber() {
		List<String> pageNumbers = new ArrayList<String>();
		for (int i = 1; i <= getTotalPage(); i++) {
			if (getPageNow() - i <= 9 && getPageNow() - i > -10) {
				pageNumbers.add(i + "");
			}
		}
		pageNumber = pageNumbers;
		return pageNumber;
	}

	public void setPageNumber(List<String> pageNumber) {
		this.pageNumber = pageNumber;
	}

	@Override
	public String toString() {
		return "PageBean [pageNow=" + pageNow + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", totalSize="
		        + totalSize + ", hasFirst=" + hasFirst + ", hasPre=" + hasPre + ", hasNext=" + hasNext + ", hasLast="
		        + hasLast + "]";
	}

}
