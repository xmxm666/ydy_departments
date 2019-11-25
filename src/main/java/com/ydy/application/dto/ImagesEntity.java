package com.ydy.application.dto;


import lombok.Data;

@Data
public class ImagesEntity {
	
	public String key;
	public String hash;
	public Long fsize;
	public String mimeType;
	
}