package project.go.pcgogo.faq.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import project.go.pcgogo.faq.model.vo.AttachFile;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

public interface FAQDao {

	List<Map<String, String>> selectFaqList(int cPage, int numPerPage);

	int selectFaqTotalContents();

	List<Map<String, String>> selectSearchFaqList(String searchOption, String searchKeyword);

	int selectSearchFaqTotalContents(String searchOption, String searchKeyword);

	List<Map<String, String>> selectFaqView(int postNo);
	
	List<Map<String, Object>> selectFaqAttachView(int postNo);
	
	int increaseReadCount(int postNo);

	int insertFaq(Post post, List<AttachFile> attachList);

	int updateFaq(Post post);
	
	int updateFaqFile(int attachNo);
	
	int deleteFaqFile(int attachNo);

	int deleteFaq(int postNo);
	
	int faqCommentNum(int commentNum);

	List<Map<String, String>> selectFaqCommentList(int postNo);
	
	int selectFaqCommentTotalContents(int postNo);
	
	int insertComment(PostComment pc);
	
	int updateComment(int c_postNo);
	
	int deleteComment(int c_postNo);

}
