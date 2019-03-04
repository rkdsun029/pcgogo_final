package project.go.pcgogo.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Manager implements Serializable{
	private static final long serialVersionUID = 1L;
	private String managerId;
	private String managerPassword;
	private String managerCode;
	private String managerCodeImgOriginal;
	private String managerCodeImgRenamed;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String managerAddress;
	private Date managerEnrollDate;
	private String managerPermitted;
	private String isSocial = "manager";
	
	public Manager() {}

	public Manager(String managerId, String managerPassword, String managerCode, String managerCodeImgOriginal,
			String managerCodeImgRenamed, String managerName, String managerPhone, String managerEmail,
			String managerAddress, Date managerEnrollDate, String managerPermitted) {
		this.managerId = managerId;
		this.managerPassword = managerPassword;
		this.managerCode = managerCode;
		this.managerCodeImgOriginal = managerCodeImgOriginal;
		this.managerCodeImgRenamed = managerCodeImgRenamed;
		this.managerName = managerName;
		this.managerPhone = managerPhone;
		this.managerEmail = managerEmail;
		this.managerAddress = managerAddress;
		this.managerEnrollDate = managerEnrollDate;
		this.managerPermitted = managerPermitted;
	}

	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", managerPassword=" + managerPassword + ", managerCode="
				+ managerCode + ", managerCodeImgOriginal=" + managerCodeImgOriginal + ", managerCodeImgRenamed="
				+ managerCodeImgRenamed + ", managerName=" + managerName + ", managerPhone=" + managerPhone
				+ ", managerEmail=" + managerEmail + ", managerAddress=" + managerAddress + ", managerEnrollDate="
				+ managerEnrollDate + ", managerPermitted=" + managerPermitted + "]";
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

	public String getManagerCodeImgOriginal() {
		return managerCodeImgOriginal;
	}

	public void setManagerCodeImgOriginal(String managerCodeImgOriginal) {
		this.managerCodeImgOriginal = managerCodeImgOriginal;
	}

	public String getManagerCodeImgRenamed() {
		return managerCodeImgRenamed;
	}

	public void setManagerCodeImgRenamed(String managerCodeImgRenamed) {
		this.managerCodeImgRenamed = managerCodeImgRenamed;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
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

	public Date getManagerEnrollDate() {
		return managerEnrollDate;
	}

	public void setManagerEnrollDate(Date managerEnrollDate) {
		this.managerEnrollDate = managerEnrollDate;
	}

	public String getManagerPermitted() {
		return managerPermitted;
	}

	public void setManagerPermitted(String managerpermitted) {
		this.managerPermitted = managerpermitted;
	}

	public String getIsSocial() {
		return isSocial;
	}
}
