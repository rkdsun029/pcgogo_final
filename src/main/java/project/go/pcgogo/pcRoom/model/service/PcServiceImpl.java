package project.go.pcgogo.pcRoom.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.manager.model.vo.PriceList;
import project.go.pcgogo.pcRoom.model.dao.PcDao;
import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoomDetail;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsvDetail;

@Service
public class PcServiceImpl implements PcService {

	@Autowired
	PcDao pcDao;

	@Override
	public List<PcRoomList> pcRoomList(String place_name) {
		System.out.println("Service"+place_name);
		return pcDao.pcRoomList(place_name);
	}
	
	@Override
	public List<PcRoomRsv> pcRoomRsv(String pcRoomNo) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomRsv(pcRoomNo);
	}


	@Override
	public int pcRoomRsvGo(PcRoomRsv rsv) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomRsvGo(rsv);
	}

	@Override
	public int pcRoomRsvSet(Map<String, String> map) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomRsvSet(map);
	}

	@Override
	public int pcRoomRsvDetail(PcRoomRsvDetail rsv) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomRsvDetail(rsv);
	}

	@Override
	public int deleteRsv() {
		// TODO Auto-generated method stub
		
		return pcDao.deleteRsv();
	}

	@Override
	public int buyCashEnd(Map<String, String> map) {
		// TODO Auto-generated method stub
		return pcDao.buyCashEnd(map);
	}

	@Override
	public List<PriceList> pcRoomProduct(String pcRoomNo) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomProduct(pcRoomNo);
	}

	@Override
	public List<NowPcStatus> nowPcStatus(String pcRoomName) {
		// TODO Auto-generated method stub
		return pcDao.nowPcStatus(pcRoomName);
	}


	@Override
	public List<PcRoomDetail> pcRoomDetail(String pcRoomName) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomDetail(pcRoomName);
	}

	@Override
	public List<PcRoomDetail> pcRoomDetailDesc(PcRoomDetail d) {
		// TODO Auto-generated method stub
		return pcDao.pcRoomDetailDesc(d);
	}



	
}
