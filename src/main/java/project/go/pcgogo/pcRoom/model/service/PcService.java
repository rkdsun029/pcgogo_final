package project.go.pcgogo.pcRoom.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.manager.model.vo.PriceList;
import project.go.pcgogo.pcRoom.model.vo.NowPcStatus;
import project.go.pcgogo.pcRoom.model.vo.PcRoomDetail;
import project.go.pcgogo.pcRoom.model.vo.PcRoomList;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsv;
import project.go.pcgogo.pcRoom.model.vo.PcRoomRsvDetail;

public interface PcService {

	List<PcRoomList> pcRoomList(String place_name);

	List<PcRoomRsv> pcRoomRsv(String pcRoomNo);

	int pcRoomRsvGo(PcRoomRsv rsv);

	int pcRoomRsvSet(Map<String, String> map);

	int pcRoomRsvDetail(PcRoomRsvDetail rsv);

	int deleteRsv();

	int buyCashEnd(Map<String, String> map);

	List<PriceList> pcRoomProduct(String pcRoomNo);

	List<NowPcStatus> nowPcStatus(String pcRoomName);

	List<PcRoomDetail> pcRoomDetail(String pcRoomName);

	List<PcRoomDetail> pcRoomDetailDesc(PcRoomDetail d);

}
