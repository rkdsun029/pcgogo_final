package project.go.pcgogo.pcRoom.model.service;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;

public interface PcService {

	List<PcRoom> pcList(String pcRoom);

	List<PcRoomList> pcRoomList(String place_name);

	String nowPcStatus(String pcRoomName);
}
