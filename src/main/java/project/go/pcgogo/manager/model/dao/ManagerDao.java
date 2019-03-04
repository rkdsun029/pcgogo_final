package project.go.pcgogo.manager.model.dao;

import project.go.pcgogo.user.model.vo.Manager;

public interface ManagerDao {

	Manager selectOne(String managerId);

}
