package project.go.pcgogo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.member.model.dao.MemberDao;
import project.go.pcgogo.member.model.vo.Manager;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int insertManager(Manager manager) {
		return memberDao.insertManager(manager);
	}

}
