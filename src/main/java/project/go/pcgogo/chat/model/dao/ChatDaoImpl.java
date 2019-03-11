package project.go.pcgogo.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.chat.model.vo.InsertChat;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertChat(InsertChat chat) {
		return sqlSession.insert("chat.insertChat", chat);
	}

	@Override
	public List<Chat> selectByToId(String fromId) {
		
		System.out.println("Dao@받는 사람 : " + fromId);
		List<Chat> list = sqlSession.selectList("chat.selectByToId", fromId);
		
		
		System.out.println("Dao@채팅있으면~ : " + list);
		
		return list;
	}

//	@Override
//	public Chat messageView(String toId) {
//		return sqlSession.selectOne("chat.messageView", toId);
//	}
}
