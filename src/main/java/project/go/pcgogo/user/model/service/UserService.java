package project.go.pcgogo.user.model.service;

import java.util.List;

import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

public interface UserService {

	int insertManager(Manager manager);

	int insertMember(Member m);

	int checkDuplicate(String userId);

	Member selectOneMember(String userId);

	Manager selectOneManager(String userId);

}