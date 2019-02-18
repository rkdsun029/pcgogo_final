package project.go.pcgogo.lostandfound.model.dao;

import java.util.List;
import java.util.Map;

public interface LofDao {

	List<Map<String, String>> selectlnfList(int cPage, int numPerPage);

	int selectlnfTotalContents();

}
