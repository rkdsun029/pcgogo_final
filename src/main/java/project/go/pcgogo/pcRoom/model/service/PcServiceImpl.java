package project.go.pcgogo.pcRoom.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.pcRoom.model.dao.PcDao;
import project.go.pcgogo.pcRoom.model.vo.pcRoom;

@Service
public class PcServiceImpl implements PcService {

	@Autowired
	PcDao pcDao;

	@Override
	public List<pcRoom> pcList(String pcRoom) {
		System.out.println("Service"+pcRoom);
		return pcDao.pcList(pcRoom);
	}

	
}
