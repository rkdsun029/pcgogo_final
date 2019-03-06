package project.go.pcgogo.manager.model.service;

import project.go.pcgogo.manager.model.vo.PcRoom;
import project.go.pcgogo.user.model.vo.Manager;

public interface ManagerService {

	Manager selectOne(String managerId);

	int insertPcRoom(PcRoom pcRoom);

}
