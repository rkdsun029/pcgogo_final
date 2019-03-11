package project.go.pcgogo.admin.model.vo;

public class Admin {
	private String adminId;
	private String adminPassword;
	private String isSocial = "admin";
	
	public Admin() {}
	
	public Admin(String adminId, String adminPassword) {
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}
	
	public String getAdminId() {
		return this.adminId;
	}
	
	public String getAdminPassword() {
		return this.adminPassword;
	}
	
	public String getIsSocial() {
		return this.isSocial;
	}
}
