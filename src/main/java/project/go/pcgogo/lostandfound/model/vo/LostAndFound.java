package project.go.pcgogo.lostandfound.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class LostAndFound implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String lnfUserName;
	private String lnfEnrollName;
	private int lnfNo;
	private String lnfType;
	private String lnfName;
	private String lnfPcRoomName;
	private Date lnfGetDate;
	private String lnfStatus;
	
	public LostAndFound() {}

	public LostAndFound(String lnfUserName, String lnfEnrollName, int lnfNo, String lnfType, String lnfName,
			String lnfPcRoomName, Date lnfGetDate, String lnfStatus) {
		super();
		this.lnfUserName = lnfUserName;
		this.lnfEnrollName = lnfEnrollName;
		this.lnfNo = lnfNo;
		this.lnfType = lnfType;
		this.lnfName = lnfName;
		this.lnfPcRoomName = lnfPcRoomName;
		this.lnfGetDate = lnfGetDate;
		this.lnfStatus = lnfStatus;
	}

	public String getLnfUserName() {
		return lnfUserName;
	}

	public void setLnfUserName(String lnfUserName) {
		this.lnfUserName = lnfUserName;
	}

	public String getLnfEnrollName() {
		return lnfEnrollName;
	}

	public void setLnfEnrollName(String lnfEnrollName) {
		this.lnfEnrollName = lnfEnrollName;
	}

	public int getLnfNo() {
		return lnfNo;
	}

	public void setLnfNo(int lnfNo) {
		this.lnfNo = lnfNo;
	}

	public String getLnfType() {
		return lnfType;
	}

	public void setLnfType(String lnfType) {
		this.lnfType = lnfType;
	}

	public String getLnfName() {
		return lnfName;
	}

	public void setLnfName(String lnfName) {
		this.lnfName = lnfName;
	}

	public String getLnfPcRoomName() {
		return lnfPcRoomName;
	}

	public void setLnfPcRoomName(String lnfPcRoomName) {
		this.lnfPcRoomName = lnfPcRoomName;
	}

	public Date getLnfGetDate() {
		return lnfGetDate;
	}

	public void setLnfGetDate(Date lnfGetDate) {
		this.lnfGetDate = lnfGetDate;
	}

	public String getLnfStatus() {
		return lnfStatus;
	}

	public void setLnfStatus(String lnfStatus) {
		this.lnfStatus = lnfStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LostAndFound [lnfUserName=" + lnfUserName + ", lnfEnrollName=" + lnfEnrollName + ", lnfNo=" + lnfNo
				+ ", lnfType=" + lnfType + ", lnfName=" + lnfName + ", lnfPcRoomName=" + lnfPcRoomName + ", lnfGetDate="
				+ lnfGetDate + ", lnfStatus=" + lnfStatus + "]";
	}


}
