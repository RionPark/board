package com.file.board.vo;

import lombok.Data;

@Data
public class PageVO {
	private int pageNum;
	private int startNum;
	private int endNum;	
	private int totalCnt;
	private int startBlock;
	private int endBlock;
}
