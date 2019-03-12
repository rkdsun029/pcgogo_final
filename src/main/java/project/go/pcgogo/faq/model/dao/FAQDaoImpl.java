package project.go.pcgogo.faq.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.faq.model.vo.AttachFile;
import project.go.pcgogo.faq.model.vo.Post;
import project.go.pcgogo.faq.model.vo.PostComment;

@Repository
public class FAQDaoImpl implements FAQDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectFaqList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("faq.selectFaqList", null, rowBounds);
	}

	@Override
	public int selectFaqTotalContents() {
		return sqlSession.selectOne("faq.selectFaqTotalContents");
	}
	
	@Override
	public List<Map<String, Object>> selectFaqListCategory(String category) {
		return sqlSession.selectList("faq.selectFaqListCategory", category);
	}
	
	@Override
	public int selectFaqSelectContents(String category) {
		return sqlSession.selectOne("faq.selectFaqSelectContents", category);
	}

	@Override
	public List<Map<String, String>> selectSearchFaqList(String searchOption, String searchKeyword) {
		// 검색 옵션, 키워드를 맵에 저장
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("searchKeyword", searchKeyword);
		return sqlSession.selectList("faq.selectSearchFaqList", searchMap);
	}

	@Override
	public int selectSearchFaqTotalContents(String searchOption, String searchKeyword) {
		// 검색 옵션, 키워드를 맵에 저장
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("searchKeyword", searchKeyword);
		return sqlSession.selectOne("faq.selectSearchFaqTotalContents", searchMap);
	}

	@Override
	public List<Map<String, String>> selectFaqView(int postNo) {
		return sqlSession.selectList("faq.selectFaqView", postNo);
	}
	
	@Override
	public List<Map<String, Object>> selectFaqAttachView(int postNo) {
		return sqlSession.selectList("faq.selecctFaqAttachView", postNo);
	}
	
	@Override
	public int increaseReadCount(int postNo) {
		return sqlSession.update("faq.increaseReadCount", postNo);
	}

	@Override
	public int insertFaq(Post post, List<AttachFile> attachList) {
		return sqlSession.insert("faq.insertFaq", post);
	}
	
	@Override
	public int fileDownload(int postNo) {
		return 0;
	}

	@Override
	public int updateFaq(Post post) {
		return sqlSession.update("faq.updateFaq", post);
	}
	
	@Override
	public int updateFaqFile(int attachNo) {
		return sqlSession.update("attachFile.updateFaqFile", attachNo);
	}
	
	@Override
	public int deleteFaqFile(int attachNo) {
		return sqlSession.delete("attachFile.deleteFaqFile", attachNo);
	}

	@Override
	public int deleteFaq(int postNo) {
		return sqlSession.delete("faq.deleteFaq", postNo);
	}
	
	@Override
	public int faqCommentNum(int commentNum) {
		return sqlSession.selectOne("faq.faqCommentNum", commentNum);
	}

	@Override
	public List<Map<String, String>> selectFaqCommentList(int postNo) {
		return sqlSession.selectList("faqComment.selectFaqCommentList", postNo);
	}
	
	@Override
	public int selectFaqCommentTotalContents(int postNo) {
		return sqlSession.selectOne("faqComment.selectFaqCommentTotalContents", postNo);
	}

	@Override
	public int insertComment(PostComment pc) {
		return sqlSession.insert("faqComment.insertComment", pc);
	}

	@Override
	public int updateComment(int c_postNo) {
		return sqlSession.update("faqComment.updateComment", c_postNo);
	}

	@Override
	public int deleteComment(int c_postNo) {
		return sqlSession.delete("faqComment.deleteComment", c_postNo);
	}

}
