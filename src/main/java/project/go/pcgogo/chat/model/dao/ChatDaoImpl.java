package project.go.pcgogo.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.chat.model.vo.Chat;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertChat(Chat chat) {
		return sqlSession.insert("chat.insertChat", chat);
	}

}
