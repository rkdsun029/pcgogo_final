package project.go.pcgogo.lostandfound.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class LostAndFound implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String lnfUserName;
	private String lnfEnrollName;
	private int lnfNo;
	private String lnfClass;
	private String lnfName;
	private char lnfPhotoCheck;
	private String lnfOriginalFileName;
	private String lnfRenamedFile;
	private String lnfPcRoomName;
	private Date lnfGetDate;
	private String lnfStatus;
	
	public LostAndFound() {}

	public LostAndFound(String lnfUserName, String lnfEnrollName, int lnfNo, String lnfClass, String lnfName,
			char lnfPhotoCheck, String lnfOriginalFileName, String lnfRenamedFile, String lnfPcRoomName,
			Date lnfGetDate, String lnfStatus) {
		super();
		this.lnfUserName = lnfUserName;
		this.lnfEnrollName = lnfEnrollName;
		this.lnfNo = lnfNo;
		this.lnfClass = lnfClass;
		this.lnfName = lnfName;
		this.lnfPhotoCheck = lnfPhotoCheck;
		this.lnfOriginalFileName = lnfOriginalFileName;
		this.lnfRenamedFile = lnfRenamedFile;
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

	public String getLnfClass() {
		return lnfClass;
	}

	public void setLnfClass(String lnfClass) {
		this.lnfClass = lnfClass;
	}

	public String getLnfName() {
		return lnfName;
	}

	public void setLnfName(String lnfName) {
		this.lnfName = lnfName;
	}

	public char getLnfPhotoCheck() {
		return lnfPhotoCheck;
	}

	public void setLnfPhotoCheck(char lnfPhotoCheck) {
		this.lnfPhotoCheck = lnfPhotoCheck;
	}

	public String getLnfOriginalFileName() {
		return lnfOriginalFileName;
	}

	public void setLnfOriginalFileName(String lnfOriginalFileName) {
		this.lnfOriginalFileName = lnfOriginalFileName;
	}

	public String getLnfRenamedFile() {
		return lnfRenamedFile;
	}

	public void setLnfRenamedFile(String lnfRenamedFile) {
		this.lnfRenamedFile = lnfRenamedFile;
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
				+ ", lnfClass=" + lnfClass + ", lnfName=" + lnfName + ", lnfPhotoCheck=" + lnfPhotoCheck
				+ ", lnfOriginalFileName=" + lnfOriginalFileName + ", lnfRenamedFile=" + lnfRenamedFile
				+ ", lnfPcRoomName=" + lnfPcRoomName + ", lnfGetDate=" + lnfGetDate + ", lnfStatus=" + lnfStatus + "]";
	}



}
