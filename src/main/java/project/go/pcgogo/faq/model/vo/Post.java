package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class Post {
	private int postNo; // FAQ번호
	private String memberId; // 회원이름
	private String postTitle; // FAQ제목
	private String postWriter; // FAQ작성자
	private String postOriginalFile; // FAQ첨부파일(오리지널)
	private String postRenamedFile; // FAQ첨부파일(바뀐이름)
	private Date postDate; // FAQ등록일
	private int postReadCount; // FAQ조회수
	private String postOpened; // FAQ비공개여부
	
	public Post() {
		super();
	}

	public Post(int postNo, String memberId, String postTitle, String postWriter, String postOriginalFile,
			String postRenamedFile, Date postDate, int postReadCount, String postOpened) {
		super();
		this.postNo = postNo;
		this.memberId = memberId;
		this.postTitle = postTitle;
		this.postWriter = postWriter;
		this.postOriginalFile = postOriginalFile;
		this.postRenamedFile = postRenamedFile;
		this.postDate = postDate;
		this.postReadCount = postReadCount;
		this.postOpened = postOpened;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getPostOriginalFile() {
		return postOriginalFile;
	}

	public void setPostOriginalFile(String postOriginalFile) {
		this.postOriginalFile = postOriginalFile;
	}

	public String getPostRenamedFile() {
		return postRenamedFile;
	}

	public void setPostRenamedFile(String postRenamedFile) {
		this.postRenamedFile = postRenamedFile;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getPostReadCount() {
		return postReadCount;
	}

	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
	}

	public String getPostOpened() {
		return postOpened;
	}

	public void setPostOpened(String postOpened) {
		this.postOpened = postOpened;
	}

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", memberId=" + memberId + ", postTitle=" + postTitle + ", postWriter="
				+ postWriter + ", postOriginalFile=" + postOriginalFile + ", postRenamedFile=" + postRenamedFile
				+ ", postDate=" + postDate + ", postReadCount=" + postReadCount + ", postOpened=" + postOpened + "]";
	}
	
}
