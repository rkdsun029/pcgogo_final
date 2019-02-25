package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.PcRoom;

public interface PcDao {

	List<PcRoom> pcList(String pcRoom);

}
