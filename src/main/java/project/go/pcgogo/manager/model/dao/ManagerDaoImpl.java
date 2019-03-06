package project.go.pcgogo.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.user.model.vo.Manager;

@Repository
public class ManagerDaoImpl implements ManagerDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Manager selectOne(String managerId) {
		return sqlSession.selectOne("manager.selectOne", managerId);
	}

	@Override
	public int insertPcRoom(PcRoom pcRoom) {
		return sqlSession.insert("manager.insertPcRoom", pcRoom);
	}
}
