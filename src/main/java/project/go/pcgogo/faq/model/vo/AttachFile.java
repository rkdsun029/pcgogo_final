package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class AttachFile {
	private int attachNo; // 
	private int a_postNo; // 
	private String originalFileName;  // 
	private String renamedFileName; // 
	private Date uploadDate; // 
	private int downloadCount; // 
	private String status; // "y" 파일 있음, "n" 파일 없음
	
	public AttachFile() {
		super();
	}

	public AttachFile(int attachNo, int a_postNo, String originalFileName, String renamedFileName, Date uploadDate,
			int downloadCount, String status) {
		super();
		this.attachNo = attachNo;
		this.a_postNo = a_postNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public int getA_PostNo() {
		return a_postNo;
	}

	public void setA_PostNo(int a_postNo) {
		this.a_postNo = a_postNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attach [attachNo=" + attachNo + ", a_postNo=" + a_postNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	
}
