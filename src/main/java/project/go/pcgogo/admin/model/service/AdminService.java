package project.go.pcgogo.admin.model.service;

import java.util.List;
import java.util.Map;

import project.go.pcgogo.user.model.vo.Manager;

public interface AdminService {

	List<Object> getPermissionList(Map<String, String> options);

	int permit(Map<String, String> options);

}
