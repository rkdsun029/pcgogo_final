package project.go.pcgogo.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	List<Object> getPermissionList(Map<String, String> options);

	int permit(Map<String, String> options);

	int refuse(Map<String, String> options);

	List<Object> getDivisionList(String division);

}
