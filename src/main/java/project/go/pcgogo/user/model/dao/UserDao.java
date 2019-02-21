package project.go.pcgogo.user.model.dao;

import java.util.Map;

import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

public interface UserDao {

	int insertManager(Manager manager);

	int insertMember(Member m);

	Object selectOneById(Map<String, String> map);

}
