package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;

@Repository
public class PcDaoImpl implements PcDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<PcRoom> pcList(String pcRoom) {
		// TODO Auto-generated method stub
		System.out.println("dao"+pcRoom);
		return sqlSession.selectList("pcRoom.pcList",pcRoom);
	}

	@Override
	public List<PcRoomList> pcRoomList(String place_name) {
		List<PcRoomList> pcs = sqlSession.selectList("pcRoom.pcRoomList",place_name);
		System.out.println("@@@@dao="+pcs);
		return pcs;
	}

	@Override
	public List<NowPcStatus> nowPcStatus(String pcRoomName) {
		return sqlSession.selectList("pcRoom.nowPcStatus",pcRoomName);
	}
	
}
