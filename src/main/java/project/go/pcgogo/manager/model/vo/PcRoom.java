package project.go.pcgogo.manager.model.vo;

import java.io.Serializable;

public class PcRoom implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int pcRoomNo;
	private String pcRoomName;
	private String pcRoomAddress;
	private String pcRoomManagerId;
	
	public PcRoom(){}
	
	public PcRoom(int pcRoomNo, String pcRoomName, String pcRoomAddress, String pcRoomManagerId) {
		super();
		this.pcRoomNo = pcRoomNo;
		this.pcRoomName = pcRoomName;
		this.pcRoomAddress = pcRoomAddress;
		this.pcRoomManagerId = pcRoomManagerId;
	}
	
	@Override
	public String toString() {
		return "PcRoom [pcRoomNo=" + pcRoomNo + ", pcRoomName=" + pcRoomName + ", pcRoomAddress=" + pcRoomAddress
				+ ", pcRoomManagerId=" + pcRoomManagerId + "]";
	}

	public int getPcRoomNo() {
		return pcRoomNo;
	}
	public void setPcRoomNo(int pcRoomNo) {
		this.pcRoomNo = pcRoomNo;
	}
	public String getPcRoomName() {
		return pcRoomName;
	}
	public void setPcRoomName(String pcRoomName) {
		this.pcRoomName = pcRoomName;
	}
	public String getPcRoomAddress() {
		return pcRoomAddress;
	}
	public void setPcRoomAddress(String pcRoomAddress) {
		this.pcRoomAddress = pcRoomAddress;
	}
	public String getPcRoomManagerId() {
		return pcRoomManagerId;
	}
	public void setPcRoomManagerId(String pcRoomManagerId) {
		this.pcRoomManagerId = pcRoomManagerId;
	}
}
