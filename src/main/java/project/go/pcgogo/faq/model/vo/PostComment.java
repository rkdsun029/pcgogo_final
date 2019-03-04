package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class PostComment {
	private int c_postNo; // FAQ댓글번호
	private int o_postNo; // FAQ번호
	private String c_memberId; // 회원아이디
	private String c_postWriter; // FAQ댓글작성자
	private Date c_postEnrollDatae; // FAQ댓글작성일
	private String c_content; // 댓글내용
	
	public PostComment() {
		super();
	}

	public PostComment(int c_postNo, int o_postNo, String c_memberId, String c_postWriter, Date c_postEnrollDatae,
			String c_content) {
		super();
		this.c_postNo = c_postNo;
		this.o_postNo = o_postNo;
		this.c_memberId = c_memberId;
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

	public int getO_PostNo() {
		return o_postNo;
	}

	public void setO_PostNo(int o_postNo) {
		this.o_postNo = o_postNo;
	}

	public String getC_MemberId() {
		return c_memberId;
	}

	public void setC_MemberId(String c_memberId) {
		this.c_memberId = c_memberId;
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
		return "PostComment [c_postNo=" + c_postNo + ", o_postNo=" + o_postNo + ", c_memberId=" + c_memberId + ", c_postWriter="
				+ c_postWriter + ", c_postEnrollDatae=" + c_postEnrollDatae + ", c_content=" + c_content + "]";
	}
	
}
