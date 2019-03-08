package project.go.pcgogo.manager.model.dao;

import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.manager.model.vo.Placement;
import project.go.pcgogo.user.model.vo.Manager;

public interface ManagerDao {

	Manager selectOne(String managerId);

	int insertPcRoom(PcRoom pcRoom);

	int insertPlacement(Placement placement);

}
