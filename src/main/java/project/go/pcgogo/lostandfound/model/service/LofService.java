package project.go.pcgogo.lostandfound.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.lostandfound.model.vo.LostAndFound;

public interface LofService {

	List<Map<String, String>> selectlnfList(int cPage, int numPerPage);

	int selectlnfTotalContents();

	List<LostAndFound> selectlnfListType(int no);

}
