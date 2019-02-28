package project.go.pcgogo.chat.model.service;

import java.util.List;

import project.go.pcgogo.chat.model.vo.Chat;

public interface ChatService {

	int insertChat(Chat chat);

	Chat messageView(String fromId);

}
