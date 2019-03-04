package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;

public interface PcDao {

	List<PcRoom> pcList(String pcRoom);

	List<PcRoomList> pcRoomList(String place_name);

	String nowPcStatus(String pcRoomName);

}
