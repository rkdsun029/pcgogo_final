package project.go.pcgogo.admin.model.dao;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.user.model.vo.Manager;

public interface AdminDao {

	List<Object> getPermissionList(Map<String, String> options);

	int permit(Map<String, String> options);

}
