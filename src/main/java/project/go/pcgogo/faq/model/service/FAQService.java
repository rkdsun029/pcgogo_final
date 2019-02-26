package project.go.pcgogo.faq.model.service;

import java.util.List;
import java.util.Map;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

public interface FAQService {

	List<Map<String, String>> selectFaqList(int cPage, int numPerPage);

	List<Map<String, String>> selectSearchFaqList(String searchKeyword);

	int selectSearchFaqtotalContents(String searchKeyword);

	Map<String, String> selectFaqView(int postNo);
	
	int increaseReadCount(int postReadCount);

	int insertFaq(Post post);

	int updateFaq(Post post);

	int deleteFaq(int postNo);

	List<Map<String, String>> selectComment(int o_postNo);
	
	int selectFaqTotalContents();
	
	int insertComment(PostComment pc);
	
	int updateComment(PostComment pc);
	
	int deleteComment(int c_postNo);

}
