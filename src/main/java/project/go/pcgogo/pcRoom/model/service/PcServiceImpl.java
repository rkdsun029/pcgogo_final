package project.go.pcgogo.pcRoom.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.pcRoom.model.dao.PcDao;
import project.go.pcgogo.pcRoom.model.vo.PcRoom;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;

@Service
public class PcServiceImpl implements PcService {

	@Autowired
	PcDao pcDao;

	@Override
	public List<PcRoom> pcList(String pcRoom) {
		System.out.println("Service"+pcRoom);
		return pcDao.pcList(pcRoom);
	}

	@Override
	public List<PcRoomList> pcRoomList(String place_name) {
		System.out.println("Service"+place_name);
		return pcDao.pcRoomList(place_name);
	}

	@Override
	public String nowPcStatus(String pcRoomName) {
		// TODO Auto-generated method stub
		return pcDao.nowPcStatus(pcRoomName);
	}

	
}
