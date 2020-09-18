package com.file.board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.dao.PhotoBoardDAO;
import com.file.board.service.PhotoBoardService;
import com.file.board.vo.PageVO;
import com.file.board.vo.PhotoBoardVO;

@Service
public class PhotoBoardServiceImpl implements PhotoBoardService {

	private final String uploadPath = "C:\\java_study\\workspace\\file-board\\WebContent\\resources\\";
	@Autowired
	private PhotoBoardDAO pbdao;
	@Override
	public int insertPhotoBoard(MultipartFile file, PhotoBoardVO pb) {

		String orgFileName = file.getOriginalFilename();
		String extName = orgFileName.substring(orgFileName.lastIndexOf("."));
		String fileName = System.nanoTime() + extName;
		pb.setPbPhotoName(orgFileName);
		pb.setPbPhotoPath(fileName);
		int cnt = pbdao.insertPhotoBoard(file, pb);
		if(cnt==1) {
			File f = new File(uploadPath+fileName);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	@Override
	public List<PhotoBoardVO> selectPhotoBoardList(PhotoBoardVO pb,Model model) {
		PageVO page = pb.getPage();
		int startNum = (page.getPageNum()-1) * 10 + 1;
		int endNum = startNum + (10-1);
		page.setStartNum(startNum);
		page.setEndNum(endNum);
		int totalCnt = pbdao.selectPhotoBoardCount(pb);
		page.setTotalCnt(totalCnt);
		int totalPageSize = totalCnt/10;
		int startBlock = (page.getPageNum()-1)/10 * 10 + 1;
		int endBlock = startBlock + (10-1);
		if(endBlock>totalPageSize) {
			endBlock = totalPageSize;
		}
		page.setStartBlock(startBlock);
		page.setEndBlock(endBlock);
		pb.setPage(page);
		model.addAttribute("page",page);
		model.addAttribute("pbList",pbdao.selectPhotoBoardList(pb));
		return null;
	}
	@Override
	public int deletePhotoBoards(int[] pbNums) {
		return pbdao.deletePhotoBoards(pbNums);
	}

}
