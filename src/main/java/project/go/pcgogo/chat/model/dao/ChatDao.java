package project.go.pcgogo.chat.model.dao;

import java.util.List;

import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.chat.model.vo.InsertChat;

public interface ChatDao {

	int insertChat(InsertChat chat);

	List<Chat> selectByToId(String fromId);

//	Chat messageView(String toId);
	
}
