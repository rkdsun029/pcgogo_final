package project.go.pcgogo.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.user.model.vo.Manager;

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

}
