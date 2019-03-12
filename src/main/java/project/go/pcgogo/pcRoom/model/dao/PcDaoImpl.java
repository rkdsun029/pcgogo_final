package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.manager.model.vo.PriceList;
import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoomDetail;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsvDetail;

@Repository
public class PcDaoImpl implements PcDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<PcRoomList> pcRoomList(String place_name) {
		List<PcRoomList> pcs = sqlSession.selectList("pcRoom.pcRoomList",place_name);
		System.out.println("@@@@dao="+pcs);
		return pcs;
	}

	@Override
	public List<PcRoomRsv> pcRoomRsv(String pcRoomNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pcRoom.pcRoomRsv", pcRoomNo);
	}

	@Override
	public int pcRoomRsvGo(PcRoomRsv rsv) {
		// TODO Auto-generated method stub
		return sqlSession.update("pcRoom.pcRoomRsvGo",rsv);
	}

	@Override
	public int pcRoomRsvSet(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("pcRoom.pcRoomRsvSet",map);
	}

	@Override
	public int pcRoomRsvDetail(PcRoomRsvDetail rsv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("pcRoom.pcRoomRsvDetail",rsv);
	}

	@Override
	public int deleteRsv() {
		// TODO Auto-generated method stub
		
		return sqlSession.delete("pcRoom.pcRoomDelete");
	}

	@Override
	public int buyCashEnd(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("pcRoom.buyCashEnd",map);
	}

	@Override
	public List<NowPcStatus> nowPcStatus(String pcRoomName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pcRoom.nowPcStatus",pcRoomName);
	}

	@Override
	public List<PriceList> pcRoomProduct(String pcRoomNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pcRoom.pcRoomProduct",pcRoomNo);
	}

	@Override
	public List<PcRoomDetail> pcRoomDetail(String pcRoomName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pcRoom.pcRoomDetail", pcRoomName);
	}

	@Override
	public List<PcRoomDetail> pcRoomDetailDesc(PcRoomDetail d) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pcRoom.pcRoomDetailDesc",d);
	}



}
