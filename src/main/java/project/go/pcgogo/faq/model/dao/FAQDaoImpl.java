package project.go.pcgogo.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, String>> selectSearchFaqList(String searchKeyword) {
		return sqlSession.selectList("faq.selectSearchList", searchKeyword);
	}

	@Override
	public int selectSearchFaqtotalContents(String searchKeyword) {
		return sqlSession.selectOne("faq.selectSearchFaqTotalContents", searchKeyword);
	}

	@Override
	public Map<String, String> selectFaqView(int postNo) {
		return sqlSession.selectOne("faq.selectFaqView", postNo);
	}
	
	@Override
	public int increaseReadCount(int postReadCount) {
		return sqlSession.update("faq.increaseReadCount", postReadCount);
	}

	@Override
	public int insertFaq(Post post) {
		return sqlSession.insert("faq.insertFaq");
	}

	@Override
	public int updateFaq(Post post) {
		return sqlSession.update("faq.updateFaq");
	}

	@Override
	public int deleteFaq(int postNo) {
		return sqlSession.delete("faq.deleteFaq", postNo);
	}

	@Override
	public List<Map<String, String>> selectComment(int o_postNo) {
		return sqlSession.selectList("faq.selectComment", o_postNo);
	}

	@Override
	public int insertComment(PostComment pc) {
		return 0;
	}

	@Override
	public int updateComment(PostComment pc) {
		return 0;
	}

	@Override
	public int deleteComment(int c_postNo) {
		return 0;
	}

}
