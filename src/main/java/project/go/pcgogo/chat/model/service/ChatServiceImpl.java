package project.go.pcgogo.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.chat.model.dao.ChatDao;
import project.go.pcgogo.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;
	
	@Override
	public int insertChat(Chat chat) {
		return chatDao.insertChat(chat);
	}

}
