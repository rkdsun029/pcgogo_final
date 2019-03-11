package project.go.pcgogo.faq.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Post implements Serializable{
	private static final long serialVersionUID = 1L;
	private String category; // 게시글 카테고리
	private int postNo; // FAQ번호
	private String postTitle; // 게시글제목
	private String postWriter; // 작성자
	private String postContent; // 게시글내용
	private String postOriginalFile; // 첨부파일 original
	private String postRenamedFile; // 첨부파일 renamed
	private Date postDate; // 게시글등록일
	private int postReadCount; // 조회수
	private String postOpened; // 공개유무 (기본: 공개('Y'))
	private int attachNo; // 첨부파일개수
	private int commentNum; // 댓글개수
	private List<AttachFile> files; // 등록된 첨부파일

	
	public Post() {
		super();
	}

	public Post(String category, int postNo, String postTitle, String postWriter, String postContent, 
			String postOriginalFile, String postRenamedFile, Date postDate, int postReadCount, String postOpened, 
			int attachNo, int commentNum, List<AttachFile> files) {
		super();
		this.category = category;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postWriter = postWriter;
		this.postContent = postContent;
		this.postOriginalFile = postOriginalFile;
		this.postRenamedFile = postRenamedFile;
		this.postDate = postDate;
		this.postReadCount = postReadCount;
		this.postOpened = postOpened;
		this.attachNo = attachNo;
		this.commentNum = commentNum;
		this.files = files;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
	
	public String getPostContent() {
		return postContent;
	}
	
	public void setPostContent(String postContent) {
		this.postContent = postContent;
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
	
	public int getAttachNo() {
		return attachNo;
	}
	
	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}
	
	public int getCommentNum() {
		return commentNum;
	}
	
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	
	public List<AttachFile> getFiles() {
		return files;
	}
	public void setFiles(List<AttachFile> files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "Post [category=" + category + ", postNo=" + postNo + ", postTitle=" + postTitle + ", postWriter="
				+ postWriter + ", postContent" + postContent + ", postOriginalFile=" + postOriginalFile 
				+ ", postRenamedFile=" + postRenamedFile + ", postDate=" + postDate + ", postReadCount=" 
				+ postReadCount + ", postOpened=" + postOpened + ", attachNo=" + attachNo + 
				", commentNum=" + commentNum + ", files=" + files +  "]";
	}
	
}
