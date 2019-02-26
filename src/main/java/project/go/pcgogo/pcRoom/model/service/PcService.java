package project.go.pcgogo.pcRoom.model.service;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.PcRoom;

public interface PcService {

	List<PcRoom> pcList(String pcRoom);
}
