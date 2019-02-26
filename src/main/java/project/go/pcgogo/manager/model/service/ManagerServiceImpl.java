package project.go.pcgogo.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.manager.model.dao.ManagerDao;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao managerDao;
	
}
