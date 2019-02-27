package project.go.pcgogo.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertManager(Manager manager) {
		return sqlSession.insert("user.insertManager", manager);
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("user.insertMember", m);
	}

	@Override
	public int checkDuplicate(String userId) {
		return sqlSession.selectOne("user.checkDup", userId);
	}

	@Override
	public Member selectOneMember(String userId) {
		return sqlSession.selectOne("user.selectOneMember", userId);
	}

	@Override
	public Manager selectOneManager(String userId) {
		return sqlSession.selectOne("user.selectOneManager", userId);
	}
}
