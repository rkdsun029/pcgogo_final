package project.go.pcgogo.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Object> getPermissionList(Map<String, String> options) {
		return sqlSession.selectList("admin.getPermissionList", options);
	}

	@Override
	public int permit(Map<String, String> options) {
		return sqlSession.update("admin.permit", options);
	}

	@Override
	public int refuse(Map<String, String> options) {
		return sqlSession.delete("admin.refuse", options);
	}

	@Override
	public List<Object> getDivisionList(String division) {
		return sqlSession.selectList("admin.getDivisionList", division);
	}

}
