package project.go.pcgogo.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberPhone;
	private Date memberEnrollDate;
	private String isSocial;
	private String memberCash;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPassword, String memberEmail, String memberPhone, Date memberEnrollDate,
			String isSocial, String memberCash) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberEnrollDate = memberEnrollDate;
		this.isSocial = isSocial;
		this.memberCash = memberCash;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberEmail=" + memberEmail
				+ ", memberPhone=" + memberPhone + ", memberEnrollDate=" + memberEnrollDate + ", isSocial=" + isSocial
				+ ", memberCash=" + memberCash + "]";
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}
	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}
	public String getIsSocial() {
		return isSocial;
	}
	public void setIsSocial(String isSocial) {
		this.isSocial = isSocial;
	}
	public String getMemberCash() {
		return memberCash;
	}
	public void setMemberCash(String memberCash) {
		this.memberCash = memberCash;
	}
	
}
