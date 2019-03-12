package project.go.pcgogo.faq.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.faq.model.vo.AttachFile;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

public interface FAQService {

	List<Map<String, String>> selectFaqList(int cPage, int numPerPage);
	
	int selectFaqTotalContents();
	
	List<Map<String, Object>> selectFaqListCategory(String category);
	
	int selectFaqSelectContents(String category);

	List<Map<String, String>> selectSearchFaqList(String searchOption, String searchKeyword);

	int selectSearchFaqTotalContents(String searchOption, String searchKeyword);

	Post selectFaqView(int postNo);
	
	List<Map<String, Object>> selectFaqAttachView(int postNo);
	
	int increaseReadCount(int postNo);

	int insertFaq(Post post, List<AttachFile> attachList);

	int fileDownload(int postNo);
	
	int updateFaq(Post post);
	
	int updateFaqFile(int attachNo);
	
	int deleteFaqFile(int attachNo);

	int deleteFaq(int postNo);
	
	int faqCommentNum(int commentNum);
	
	PostComment selectFaqCommentList(int postNo);
	
	int selectFaqCommentTotalContents(int postNo);
	
	int insertComment(PostComment pc);
	
	int updateComment(int c_postNo);
	
	int deleteComment(int c_postNo);

}
