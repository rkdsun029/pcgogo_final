package project.go.pcgogo.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import project.go.pcgogo.user.model.dao.UserDao;
import project.go.pcgogo.user.model.vo.Manager;
import project.go.pcgogo.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	
	@Override
	public int insertManager(Manager manager) {
		return userDao.insertManager(manager);
	}

	@Override
	public int insertMember(Member m) {
		return userDao.insertMember(m);
	}

	@Override
	public int checkDuplicate(String userId) {
		return userDao.checkDuplicate(userId);
	}

	@Override
	public Member selectOneMember(String userId) {
		return userDao.selectOneMember(userId);
	}

	@Override
	public Manager selectOneManager(String userId) {
		return userDao.selectOneManager(userId);
	}

	@Override
	public List<User> selectByName(String memberId) {
		return userDao.selectByName(memberId);
	}

	@Override
	public int updatePwd(Map<String, String> map) {
		return userDao.updatePwd(map);
	}

}
