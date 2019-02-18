package project.go.pcgogo.lostandfound.model.vo;

import java.io.Serializable;
import java.util.Date;

public class lostandfound implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String lnfUserName;
	private String lnfEnrollName;
	private int lnfNo;
	private int lnfClass;
	private String lnfName;
	private char lnfPhotoCheck;
	private String lnfOriginalFileName;
	private String lnfRenamedFile;
	private String lnfPcRoonName;
	private Date lnfGetDate;
	private String lnfStatus;
	
	public lostandfound() {}

	public lostandfound(String lnfUserName, String lnfEnrollName, int lnfNo, int lnfClass, String lnfName,
			char lnfPhotoCheck, String lnfOriginalFileName, String lnfRenamedFile, String lnfPcRoonName,
			Date lnfGetDate) {
		super();
		this.lnfUserName = lnfUserName;
		this.lnfEnrollName = lnfEnrollName;
		this.lnfNo = lnfNo;
		this.lnfClass = lnfClass;
		this.lnfName = lnfName;
		this.lnfPhotoCheck = lnfPhotoCheck;
		this.lnfOriginalFileName = lnfOriginalFileName;
		this.lnfRenamedFile = lnfRenamedFile;
		this.lnfPcRoonName = lnfPcRoonName;
		this.lnfGetDate = lnfGetDate;
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

	public int getLnfClass() {
		return lnfClass;
	}

	public void setLnfClass(int lnfClass) {
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

	public String getLnfPcRoonName() {
		return lnfPcRoonName;
	}

	public void setLnfPcRoonName(String lnfPcRoonName) {
		this.lnfPcRoonName = lnfPcRoonName;
	}

	public Date getLnfGetDate() {
		return lnfGetDate;
	}

	public void setLnfGetDate(Date lnfGetDate) {
		this.lnfGetDate = lnfGetDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "lostandfound [lnfUserName=" + lnfUserName + ", lnfEnrollName=" + lnfEnrollName + ", lnfNo=" + lnfNo
				+ ", lnfClass=" + lnfClass + ", lnfName=" + lnfName + ", lnfPhotoCheck=" + lnfPhotoCheck
				+ ", lnfOriginalFileName=" + lnfOriginalFileName + ", lnfRenamedFile=" + lnfRenamedFile
				+ ", lnfPcRoonName=" + lnfPcRoonName + ", lnfGetDate=" + lnfGetDate + "]";
	}
	
	

}
