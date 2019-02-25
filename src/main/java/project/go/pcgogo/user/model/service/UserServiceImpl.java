package project.go.pcgogo.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.user.model.dao.UserDao;
import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao memberDao;
	
	@Override
	public int insertManager(Manager manager) {
		return memberDao.insertManager(manager);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}

	@Override
	public int checkDuplicate(String userId) {
		return memberDao.checkDuplicate(userId);
	}

	@Override
	public Member selectOneMember(String userId) {
		return memberDao.selectOneMember(userId);
	}

	@Override
	public Manager selectOneManager(String userId) {
		return memberDao.selectOneManager(userId);
	}

}
