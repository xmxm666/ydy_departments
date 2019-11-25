package com.ydy.application.util;

import java.util.List;

import lombok.Data;

@Data
public class PageDTO<T> {
	
	public Integer totalCount;
	
	public List<T> list;

	public PageDTO(Integer totalCount, List<T> list) {
		super();
		this.totalCount = totalCount;
		this.list = list;
	}

	public PageDTO() {
		
	}
	
}
