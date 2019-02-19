package project.go.pcgogo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.member.model.vo.Manager;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertManager(Manager manager) {
		return sqlSession.insert("member.insertManager", manager);
	}
}
