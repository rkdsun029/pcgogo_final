package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class PostComment {
	private int c_postNo; // FAQ댓글번호
	private int postNo; // FAQ번호
	private String memberId; // 회원아이디
	private String c_postWriter; // FAQ댓글작성자
	private Date c_postEnrollDatae; // FAQ댓글작성일
	private String c_content; // 댓글내용
	
	public PostComment() {
		super();
	}

	public PostComment(int c_postNo, int postNo, String memberId, String c_postWriter, Date c_postEnrollDatae,
			String c_content) {
		super();
		this.c_postNo = c_postNo;
		this.postNo = postNo;
		this.memberId = memberId;
		this.c_postWriter = c_postWriter;
		this.c_postEnrollDatae = c_postEnrollDatae;
		this.c_content = c_content;
	}

	public int getC_postNo() {
		return c_postNo;
	}

	public void setC_postNo(int c_postNo) {
		this.c_postNo = c_postNo;
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

	public String getC_postWriter() {
		return c_postWriter;
	}

	public void setC_postWriter(String c_postWriter) {
		this.c_postWriter = c_postWriter;
	}

	public Date getC_postEnrollDatae() {
		return c_postEnrollDatae;
	}

	public void setC_postEnrollDatae(Date c_postEnrollDatae) {
		this.c_postEnrollDatae = c_postEnrollDatae;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	@Override
	public String toString() {
		return "PostComment [c_postNo=" + c_postNo + ", postNo=" + postNo + ", memberId=" + memberId + ", c_postWriter="
				+ c_postWriter + ", c_postEnrollDatae=" + c_postEnrollDatae + ", c_content=" + c_content + "]";
	}
	
}
