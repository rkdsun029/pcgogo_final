package project.go.pcgogo.lostandfound.model.service;

import java.util.List;
import java.util.Map;

public interface LofService {

	List<Map<String, String>> selectlnfList(int cPage, int numPerPage);

	int selectlnfTotalContents();

}
