package project.go.pcgogo.chat.model.vo;

import java.sql.Date;

public class InsertChat {
	
	private int chatNo;
	private String fromId;
	private String toId;
	private String chatContent;
	private Date chatDate;
	
	public InsertChat(int chatNo, String fromId, String toId, String chatContent, Date chatDate) {
		this.chatNo = chatNo;
		this.fromId = fromId;
		this.toId = toId;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
	}
	
	public InsertChat(String fromId, String toId, String chatContent) {
		this.fromId = fromId;
		this.toId = toId;
		this.chatContent = chatContent;
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

	public Date getChatDate() {
		return chatDate;
	}

	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}
	
	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", fromId=" + fromId + ", toId=" + toId
				+ ", chatContent=" + chatContent + ", chatDate=" + chatDate + "]";
	}
}
