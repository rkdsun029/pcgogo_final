package project.go.pcgogo.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.manager.model.dao.ManagerDao;
import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.manager.model.vo.Placement;
import project.go.pcgogo.user.model.vo.Manager;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao managerDao;

	@Override
	public Manager selectOne(String managerId) {
		Manager manager = managerDao.selectOne(managerId);
		return manager;
	}

	@Override
	public int insertPcRoom(PcRoom pcRoom) {
		int result = managerDao.insertPcRoom(pcRoom);
		return result;
	}

	@Override
	public int insertPlacement(Placement placement) {
		int result = managerDao.insertPlacement(placement);
		return result;
	}
	
	@Override
	public List<PcRoom> getPcRoomList(String managerId) {
		List<PcRoom> pList = managerDao.getPcRoomList(managerId);
		return pList;
	}
	
	@Override
	public List<Placement> getPlacementList(int pcRoomNo) {
		List<Placement> pList = managerDao.getPlacementList(pcRoomNo);
		return pList;
	}
	
	
	
	
	
	
	/*
	 * =============================================================================
	 */
	@Override
	public List<Map<String, String>> selectMemoList() {
		return managerDao.selectMemoList();
	}

	@Override
	public int insertMemo(Map<String, String> map) {
		return managerDao.insertMemo(map);
	}

	@Override
	public int deleteMemo(Map<String, String> map) {
		return managerDao.deleteMemo(map);
	}

	
}
