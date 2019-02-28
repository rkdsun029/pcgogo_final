package project.go.pcgogo.chat.model.dao;

import java.util.List;

import project.go.pcgogo.chat.model.vo.Chat;

public interface ChatDao {

	int insertChat(Chat chat);

	Chat messageView(String fromId);
	
}
