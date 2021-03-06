package project.go.pcgogo.chat.model.vo;

import java.sql.Date;

public class Chat {
	
	private int chatNo;
	private String fromId;
	private String toId;
	private String chatContent;
	private Date chatTime;
	
	public Chat() {}
	
	public Chat(int chatNo, String fromId, String toId, String chatContent, Date chatTime) {
		super();
		this.chatNo = chatNo;
		this.fromId = fromId;
		this.toId = toId;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Date getChatTime() {
		return chatTime;
	}

	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", fromId=" + fromId + ", toId=" + toId + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
}