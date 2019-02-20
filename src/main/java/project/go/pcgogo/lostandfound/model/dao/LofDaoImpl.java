package project.go.pcgogo.lostandfound.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.lostandfound.model.vo.LostAndFound;

@Repository
public class LofDaoImpl implements LofDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectlnfList(int cPage, int numPerPage) {
		RowBounds rowBounds 
			= new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("lnf.selectlofList", null, rowBounds);
	}

	@Override
	public int selectlnfTotalContents() {
		return sqlSession.selectOne("lnf.selectlofTotalContents");
	}

	@Override
	public List<LostAndFound> selectlnfListType(int no) {
		
		return sqlSession.selectList("lnf.selectlnfListType", no);
	}

}