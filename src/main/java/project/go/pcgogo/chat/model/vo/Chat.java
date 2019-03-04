package project.go.pcgogo.chat.model.vo;

import java.sql.Date;

public class Chat {
	
	private int roomNo;
	private int chatNo;
	private String fromId;
	private String toId;
	private String chatContent;
	private Date chatDate;
	
	public Chat(int roomNo, int chatNo, String fromId, String toId, String chatContent, Date chatDate) {
		super();
		this.roomNo = roomNo;
		this.chatNo = chatNo;
		this.fromId = fromId;
		this.toId = toId;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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
		return "Chat [roomNo=" + roomNo + ", chatNo=" + chatNo + ", fromId=" + fromId + ", toId=" + toId
				+ ", chatContent=" + chatContent + ", chatDate=" + chatDate + "]";
	}
}