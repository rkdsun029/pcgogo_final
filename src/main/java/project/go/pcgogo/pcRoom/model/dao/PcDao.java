package project.go.pcgogo.pcRoom.model.dao;

import java.util.List;

import project.go.pcgogo.pcRoom.model.vo.pcRoom;

public interface PcDao {

	List<pcRoom> pcList(String pcRoom);

}
