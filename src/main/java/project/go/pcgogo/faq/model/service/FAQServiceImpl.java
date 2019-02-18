package project.go.pcgogo.faq.model.service;

import java.util.List;

// import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.faq.model.dao.FAQDao;
import project.go.pcgogo.faq.model.vo.Post;

@Service
public class FAQServiceImpl implements FAQService {
	// Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	FAQDao faqDao;
	
	@Override
	public List<Post> selectFaqList(int cPage, int numPerPage) {
		return faqDao.selectFaqList(cPage, numPerPage);
	}
	
	@Override
	public int selectFaqTotalContents() {
		return faqDao.selectFaqTotalContents();
	}

	@Override
	public List<Post> selectSearchFaqList(String searchOption, String searchKeyword) {
		return faqDao.selectSearchFaqList(searchOption, searchKeyword);
	}

	@Override
	public int selectSearchFaqtotalContents(String searchOption, String searchKeyword) {
		return faqDao.selectSearchFaqtotalContents(searchOption, searchKeyword);
	}
}
