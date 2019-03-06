package project.go.pcgogo.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.go.pcgogo.chat.model.dao.ChatDao;
import project.go.pcgogo.chat.model.vo.Chat;
import project.go.pcgogo.chat.model.vo.InsertChat;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;

	@Override
	public int insertChat(InsertChat chat) {
		return chatDao.insertChat(chat);
	}

	@Override
	public List<Chat> selectByToId(String toId) {
		return chatDao.selectByToId(toId);
	}

//	@Override
//	public Chat messageView(String toId) {
//		return chatDao.messageView(toId);
//	}
}
