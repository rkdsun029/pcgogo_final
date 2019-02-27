package project.go.pcgogo.lostandfound.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import project.go.pcgogo.lostandfound.model.dao.LofDao;
import project.go.pcgogo.lostandfound.model.exception.LofException;
import project.go.pcgogo.lostandfound.model.vo.Attachment;
import project.go.pcgogo.lostandfound.model.vo.LostAndFound;

@Service
public class LofServiceImpl implements LofService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	LofDao lofDao;
	
	
	@Override
	public List<Map<String, String>> selectlnfList(int cPage, int numPerPage) {
		return lofDao.selectlnfList(cPage, numPerPage);
	}


	@Override
	public int selectlnfTotalContents() {
		return lofDao.selectlnfTotalContents();
	}


	@Override
	public List<LostAndFound> selectlnfListType(String no) {
		return lofDao.selectlnfListType(no);
	}


	@Override
	public int selectlnfSelectContents(String no) {
		return lofDao.selectlnfSelectContents(no);
	}


	@Override
	public List<LostAndFound> selectLnfNameList(String lnfName) {
		return lofDao.selectLnfNameList(lnfName);
	}


	@Override
	public int selectLnfNameCount(String lnfName) {
		return lofDao.selectLnfNameCount(lnfName);
	}


	@Override
	public List<Map<String, String>> selectViewList(int no) {
		return lofDao.selectViewList(no);
	}
	@Override
	public List<Map<String, String>> selectViewImgList(int no) {
		return lofDao.selectViewImgList(no);
	}

	@Override
	public int insertBoard(LostAndFound lostandfound, List<Attachment> attachList) {
		int result = 0;
		int lnfNo = 0;
		
		//1.게시판 테이블 등록
		result = lofDao.insertBoard(lostandfound);
		lnfNo = lostandfound.getLnfNo();
		
		System.out.println("result = "+result);
		System.out.println("lnfNo = "+lnfNo);
		
		logger.debug("lnfNo="+lnfNo);
		
		if(result == 0)
			throw new LofException("게시판 등록 오류");
		
		//2.첨부파일 테이블 등록
		if(attachList.size()>0) {
			for(Attachment a : attachList) {
				//fk boardNo 세팅
				a.setLnfNo(lnfNo);
				result = lofDao.insertAttachment(a);
				if(result == 0) 
					throw new LofException("첨부파일 등록 오류");
			}
		}
		
		return lnfNo;
	}


	@Override
	public int completeDev(LostAndFound lostandfound) {
		return lofDao.completeDev(lostandfound);
	}


	@Override
	public int deleteDev(int lnfNo) {
		return lofDao.deleteDev(lnfNo);
	}



	

}
