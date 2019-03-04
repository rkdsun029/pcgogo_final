package project.go.pcgogo.chat.model.service;

import java.util.List;

import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.chat.model.vo.InsertChat;

public interface ChatService {

	int insertChat(InsertChat chat);

	List<Chat> selectByToId(String toId);

//	Chat messageView(String toId);

}
