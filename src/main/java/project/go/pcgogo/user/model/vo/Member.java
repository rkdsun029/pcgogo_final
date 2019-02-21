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
	
	public Member() {}

	public Member(String memberId, String memberPassword, String memberEmail, String memberPhone,
			Date memberEnrollDate) {
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberEnrollDate = memberEnrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberEmail=" + memberEmail
				+ ", memberPhone=" + memberPhone + ", memberEnrollDate=" + memberEnrollDate + "]";
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
}
