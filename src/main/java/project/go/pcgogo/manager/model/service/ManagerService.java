package project.go.pcgogo.manager.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.manager.model.vo.Placement;
import project.go.pcgogo.user.model.vo.Manager;

public interface ManagerService {

	Manager selectOne(String managerId);

	int insertPcRoom(PcRoom pcRoom);

	int insertPlacement(Placement placement);

	List<PcRoom> getPcRoomList(String managerId);
	
/////////////////////////////////////////////////////////////
	
	List<Map<String, String>> selectMemoList();
	
	int insertMemo(Map<String, String> map);
	
	int deleteMemo(Map<String, String> map);
}
