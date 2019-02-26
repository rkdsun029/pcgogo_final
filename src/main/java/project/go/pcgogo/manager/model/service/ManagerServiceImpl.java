package project.go.pcgogo.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.manager.model.dao.ManagerDao;
import project.go.pcgogo.user.model.vo.Manager;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao managerDao;

	@Override
	public Manager selectOne(String managerId) {
		Manager manager = managerDao.selectOne(managerId);
		return manager;
	}
	
}
