package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class AttachFile {
	private int attachNo; // 첨부파일번호
	private int postNo; // 첨부파일 첨부된 게시글번호
	private String originalFileName;  // 원래파일명
	private String renamedFileName; // 수정된파일명
	private Date uploadDate; // 올라온날짜
	private int downloadCount; // 다운로드수
	private String status; // "y", "n"
	
	public AttachFile() {
		super();
	}

	public AttachFile(int attachNo, int postNo, String originalFileName, String renamedFileName, Date uploadDate,
			int downloadCount, String status) {
		super();
		this.attachNo = attachNo;
		this.postNo = postNo;
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

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
		return "Attach [attachNo=" + attachNo + ", postNo=" + postNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	
}
