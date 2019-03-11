package project.go.pcgogo.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.admin.model.dao.AdminDao;

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

	@Override
	public int refuse(Map<String, String> options) {
		return adminDao.refuse(options);
	}

	@Override
	public List<Object> getDivisionList(String division) {
		return adminDao.getDivisionList(division);
	}

}
