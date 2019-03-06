package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;

public interface PcDao {

	List<PcRoom> pcList(String pcRoom);

	List<PcRoomList> pcRoomList(String place_name);

	List<NowPcStatus> nowPcStatus(String pcRoomName);

	List<PcRoomRsv> pcRoomRsv(String pcRoomNo);

}
