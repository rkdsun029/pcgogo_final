package project.go.pcgogo.faq.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.faq.model.dao.FAQDao;
import project.go.pcgogo.faq.model.vo.AttachFile;
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
	public List<Map<String, String>> selectSearchFaqList(String searchOption, String searchKeyword) {
		return faqDao.selectSearchFaqList(searchOption, searchKeyword);
	}

	@Override
	public int selectSearchFaqTotalContents(String searchOption, String searchKeyword) {
		return faqDao.selectSearchFaqTotalContents(searchOption, searchKeyword);
	}

	@Override
	public List<Map<String, String>> selectFaqView(int postNo) {
		return faqDao.selectFaqView(postNo);
	}
	
	@Override
	public List<Map<String, Object>> selectFaqAttachView(int postNo) {
		return faqDao.selectFaqAttachView(postNo);
	}
	
	@Override
	public int increaseReadCount(int postNo) {
		return faqDao.increaseReadCount(postNo);

	}

	@Override
	public int insertFaq(Post post, List<AttachFile> attachList) {
		return faqDao.insertFaq(post, attachList);
	}

	@Override
	public int updateFaq(Post post) {
		return faqDao.updateFaq(post);
	}
	
	@Override
	public int updateFaqFile(int attachNo) {
		return faqDao.updateFaqFile(attachNo);
	}
	
	@Override
	public int deleteFaqFile(int attachNo) {
		return faqDao.deleteFaqFile(attachNo);
	}

	@Override
	public int deleteFaq(int postNo) {
		return faqDao.deleteFaq(postNo);
	}
	
	@Override
	public int faqCommentNum(int commentNum) {
		return faqDao.faqCommentNum(commentNum);
	}

	@Override
	public List<Map<String, String>> selectFaqCommentList(int postNo) {
		return faqDao.selectFaqCommentList(postNo);
	}
	
	@Override
	public int selectFaqCommentTotalContents(int postNo) {
		return faqDao.selectFaqCommentTotalContents(postNo);
	}

	@Override
	public int insertComment(PostComment pc) {
		return faqDao.insertComment(pc);
	}

	@Override
	public int updateComment(int c_postNo) {
		return faqDao.updateComment(c_postNo);
	}

	@Override
	public int deleteComment(int c_postNo) {
		return faqDao.deleteComment(c_postNo);
	}

}
