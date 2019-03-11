package project.go.pcgogo.faq.model.vo;

import java.sql.Date;

public class PostComment {
	private int c_postNo; // FAQ댓글번호
	private int c_postLevel; // FAQ답글확인용 댓글레벨: 첫댓글 1, 답댓글 2->3->4...
	private int c_postReplyNo; // FAQ대댓글번호
	private int o_postNo; // FAQ게시글번호
	private String c_postWriter; // FAQ댓글작성자
	private Date c_postEnrollDatae; // FAQ댓글작성일
	private String c_content; // 댓글내용
	
	public PostComment() {
		super();
	}

	public PostComment(int c_postNo, int c_postLevel, int c_postReplyNo, int o_postNo, 
			String c_postWriter, Date c_postEnrollDatae, String c_content) {
		super();
		this.c_postNo = c_postNo;
		this.c_postLevel = c_postLevel;
		this.c_postReplyNo = c_postReplyNo;
		this.o_postNo = o_postNo;
		this.c_postWriter = c_postWriter;
		this.c_postEnrollDatae = c_postEnrollDatae;
		this.c_content = c_content;
	}

	public int getC_PostNo() {
		return c_postNo;
	}

	public void setC_PostNo(int c_postNo) {
		this.c_postNo = c_postNo;
	}
	
	public int getC_PostLevel() {
		return c_postLevel;
	}
	
	public void setC_PostLevel(int c_postLevel) {
		this.c_postLevel = c_postLevel;
	}
	
	public int getC_PostReplyNo() {
		return c_postReplyNo;
	}
	
	public void setC_PostReplyNo(int c_postReplyNo) {
		this.c_postReplyNo = c_postReplyNo;
	}

	public int getO_PostNo() {
		return o_postNo;
	}

	public void setO_PostNo(int o_postNo) {
		this.o_postNo = o_postNo;
	}

	public String getC_PostWriter() {
		return c_postWriter;
	}

	public void setC_PostWriter(String c_postWriter) {
		this.c_postWriter = c_postWriter;
	}

	public Date getC_PostEnrollDatae() {
		return c_postEnrollDatae;
	}

	public void setC_PostEnrollDatae(Date c_postEnrollDatae) {
		this.c_postEnrollDatae = c_postEnrollDatae;
	}

	public String getC_Content() {
		return c_content;
	}

	public void setC_Content(String c_content) {
		this.c_content = c_content;
	}

	@Override
	public String toString() {
		return "PostComment [c_postNo=" + c_postNo + ", c_postLevel = " + c_postLevel + ", c_postReplyNo = " 
				+ c_postReplyNo + ", o_postNo=" + o_postNo  + ", c_postWriter=" + c_postWriter 
				+  ", c_postEnrollDatae=" + c_postEnrollDatae + ", c_content=" + c_content + "]";
	}
	
}
