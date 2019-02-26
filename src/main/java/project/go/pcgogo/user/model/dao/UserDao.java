package project.go.pcgogo.user.model.dao;

import java.util.List;

import org.springframework.security.core.userdetails.User;

import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

public interface UserDao {

	int insertManager(Manager manager);

	int insertMember(Member m);

	int checkDuplicate(String userId);

	Member selectOneMember(String userId);

	Manager selectOneManager(String userId);

//	List<User> selectByName(String memberId);

}
