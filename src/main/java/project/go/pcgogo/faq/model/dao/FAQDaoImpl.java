package project.go.pcgogo.faq.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.faq.model.vo.Post;

@Repository
public class FAQDaoImpl implements FAQDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Post> selectFaqList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("faq.selectFaqList", null, rowBounds);
	}
	
	@Override
	public int selectFaqTotalContents() {
		return sqlSession.selectOne("faq.selectFaqTotalContents");
	}
	
	@Override
	public List<Post> selectSearchFaqList(String searchOption, String searchKeyword) {
		return sqlSession.selectList("faq.selectSearchList", searchKeyword);
	}

	@Override
	public int selectSearchFaqtotalContents(String searchOption, String searchKeyword) {
		return sqlSession.selectOne("faq.selectSearchFaqTotalContents", searchKeyword);
	}
}
