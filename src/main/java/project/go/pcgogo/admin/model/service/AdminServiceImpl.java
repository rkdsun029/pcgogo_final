package project.go.pcgogo.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.admin.model.dao.AdminDao;
import project.go.pcgogo.user.model.vo.Manager;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao adminDao;

	@Override
	public List<Object> getPermissionList(Map<String, String> options) {
		return adminDao.getPermissionList(options);
	}

	@Override
	public int permit(Map<String, String> options) {
		return adminDao.permit(options);
	}

}
