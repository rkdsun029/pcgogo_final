package project.go.pcgogo.member.model.vo;

import java.io.Serializable;

public class Manager implements Serializable{
	private static final long serialVersionUID = 1L;
	private String managerId;
	private String managerPassword;
	private String managerCode;
	private String managerPhone;
	private String managerEmail;
	private String managerAddress;
	
	public Manager() {}
	
	public Manager(String managerId, String managerPassword, String managerCode, String managerPhone,
			String managerEmail, String managerAddress) {
		this.managerId = managerId;
		this.managerPassword = managerPassword;
		this.managerCode = managerCode;
		this.managerPhone = managerPhone;
		this.managerEmail = managerEmail;
		this.managerAddress = managerAddress;
	}
	
	
	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", managerPassword=" + managerPassword + ", managerCode="
				+ managerCode + ", managerPhone=" + managerPhone + ", managerEmail=" + managerEmail
				+ ", managerAddress=" + managerAddress + "]";
	}

	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	public String getManagerCode() {
		return managerCode;
	}
	public void setManagerCode(String managerCode) {
		this.managerCode = managerCode;
	}
	public String getManagerPhone() {
		return managerPhone;
	}
	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}
	public String getManagerEmail() {
		return managerEmail;
	}
	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}
	public String getManagerAddress() {
		return managerAddress;
	}
	public void setManagerAddress(String managerAddress) {
		this.managerAddress = managerAddress;
	}
}
