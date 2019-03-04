package project.go.pcgogo.faq.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.faq.model.dao.FAQDao;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

@Service
public class FAQServiceImpl implements FAQService {
	Logger logger = Logger.getLogger(getClass());

	@Autowired
	FAQDao faqDao;

	@Override
	public List<Map<String, String>> selectFaqList(int cPage, int numPerPage) {
		return faqDao.selectFaqList(cPage, numPerPage);
	}

	@Override
	public int selectFaqTotalContents() {
		return faqDao.selectFaqTotalContents();
	}

	@Override
	public List<Map<String, String>> selectSearchFaqList(String searchKeyword) {
		return faqDao.selectSearchFaqList(searchKeyword);
	}

	@Override
	public int selectSearchFaqtotalContents(String searchKeyword) {
		return faqDao.selectSearchFaqtotalContents(searchKeyword);
	}

	@Override
	public Map<String, String> selectFaqView(int postNo) {
		return faqDao.selectFaqView(postNo);
	}
	
	@Override
	public int increaseReadCount(int postReadCount) {
		return faqDao.increaseReadCount(postReadCount);
	}

	@Override
	public int insertFaq(Post post) {
		return faqDao.insertFaq(post);
	}

	@Override
	public int updateFaq(Post post) {
		return faqDao.updateFaq(post);
	}

	@Override
	public int deleteFaq(int postNo) {
		return faqDao.deleteFaq(postNo);
	}

	@Override
	public List<Map<String, String>> selectComment(int o_postNo) {
		return faqDao.selectComment(o_postNo);
	}

	@Override
	public int insertComment(PostComment pc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(PostComment pc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int c_postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
