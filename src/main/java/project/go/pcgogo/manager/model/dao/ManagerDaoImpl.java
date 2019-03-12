package project.go.pcgogo.manager.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.manager.model.vo.Placement;
import project.go.pcgogo.manager.model.vo.PriceList;
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

	@Override
	public int insertPlacement(Placement placement) {
		return sqlSession.insert("manager.insertPlacement", placement);
	}
	
	@Override
	public List<PcRoom> getPcRoomList(String managerId) {
		return sqlSession.selectList("manager.getPcRoomList", managerId);
	}
	
	@Override
	public List<Placement> getPlacementList(int pcRoomNo) {
		return sqlSession.selectList("manager.getPlacementList", pcRoomNo);
	}
	
	@Override
	public PriceList getPriceList(int pcRoomNo) {
		return sqlSession.selectOne("manager.getPriceList", pcRoomNo);
	}
	
	@Override
	public int deletePriceList(int pcRoomNo) {
		return sqlSession.delete("manager.deletePriceList", pcRoomNo);
	}
	
	@Override
	public int insertPriceList(PriceList newPriceList) {
		return sqlSession.insert("manager.insertPriceList", newPriceList);
	}
	
	@Override
	public int updatePriceList(PriceList newPriceList) {
		return sqlSession.update("manager.updatePriceList", newPriceList);
	}
	
	
	
	
	
	
	/*
	 * =============================================================================
	 */
	@Override
	public List<Map<String, String>> selectMemoList() {
		return sqlSession.selectList("manager.selectMemoList");
	}

	@Override
	public int insertMemo(Map<String, String> map) {
		return sqlSession.insert("manager.insertMemo",map);
	}

	@Override
	public int deleteMemo(Map<String, String> map) {
		return sqlSession.delete("manager.deleteMemo", map);
	}

	@Override
	public List<Date> getChartData(int pcRoomNo) {
		return sqlSession.selectList("manager.getChartData", pcRoomNo);
	}
}
