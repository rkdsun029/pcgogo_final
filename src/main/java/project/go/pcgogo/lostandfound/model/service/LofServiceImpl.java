package project.go.pcgogo.lostandfound.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.lostandfound.model.dao.LofDao;
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
	public List<LostAndFound> selectlnfListType(int no) {
		return lofDao.selectlnfListType(no);
	}

}
