package project.go.pcgogo.faq.model.dao;

import java.util.List;

import project.go.pcgogo.faq.model.vo.Post;

public interface FAQDao {
	
	List<Post> selectFaqList(int cPage, int numPerPage);
	
	int selectFaqTotalContents();

	List<Post> selectSearchFaqList(String searchOption, String searchKeyword);

	int selectSearchFaqtotalContents(String searchOption, String searchKeyword);

}
