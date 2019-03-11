package project.go.pcgogo.manager.model.vo;

import java.io.Serializable;

public class PcRoom implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int pcRoomNo;
	private String pcRoomName;
	private String pcRoomAddress;
	private String pcRoomManagerId;
	private String pcRoomPermitted;
	private String xLoc;
	private String yLoc;
	
	public PcRoom(){}
	
	public PcRoom(String pcRoomName, String pcRoomAddress, String pcRoomManagerId) {
		super();
		this.pcRoomName = pcRoomName;
		this.pcRoomAddress = pcRoomAddress;
		this.pcRoomManagerId = pcRoomManagerId;
	}

	public PcRoom(int pcRoomNo, String pcRoomName, String pcRoomAddress, String pcRoomManagerId,
			String pcRoomPermitted) {
		super();
		this.pcRoomNo = pcRoomNo;
		this.pcRoomName = pcRoomName;
		this.pcRoomAddress = pcRoomAddress;
		this.pcRoomManagerId = pcRoomManagerId;
		this.pcRoomPermitted = pcRoomPermitted;
	}

	public PcRoom(int pcRoomNo, String pcRoomName, String pcRoomAddress, String pcRoomManagerId, String pcRoomPermitted,
			String xLoc, String yLoc) {
		super();
		this.pcRoomNo = pcRoomNo;
		this.pcRoomName = pcRoomName;
		this.pcRoomAddress = pcRoomAddress;
		this.pcRoomManagerId = pcRoomManagerId;
		this.pcRoomPermitted = pcRoomPermitted;
		this.xLoc = xLoc;
		this.yLoc = yLoc;
	}

	@Override
	public String toString() {
		return "PcRoom [pcRoomNo=" + pcRoomNo + ", pcRoomName=" + pcRoomName + ", pcRoomAddress=" + pcRoomAddress
				+ ", pcRoomManagerId=" + pcRoomManagerId + ", pcRoomPermitted=" + pcRoomPermitted + ", xLoc=" + xLoc
				+ ", yLoc=" + yLoc + "]";
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
	public String getPcRoomPermitted() {
		return pcRoomPermitted;
	}
	public void setPcRoomPermitted(String pcRoomPermitted) {
		this.pcRoomPermitted = pcRoomPermitted;
	}

	public String getxLoc() {
		return xLoc;
	}

	public void setxLoc(String xLoc) {
		this.xLoc = xLoc;
	}

	public String getyLoc() {
		return yLoc;
	}

	public void setyLoc(String yLoc) {
		this.yLoc = yLoc;
	}
}
