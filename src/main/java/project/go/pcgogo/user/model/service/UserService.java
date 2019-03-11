package project.go.pcgogo.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.User;

import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

public interface UserService {

	int insertManager(Manager manager);

	int insertMember(Member m);

	int checkDuplicate(String userId);

	Member selectOneMember(String userId);

	Manager selectOneManager(String userId);

	List<User> selectByName(String memberId);

	int updatePwd(Map<String, String> map);

	int deleteUser(Map<String, String> options);

	int updateMember(Map<String, String> values);

	int updateManager(Map<String, String> values);

	List<Object> getReservationLog(Map<String, String> options);

}
