package project.go.pcgogo.common;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import project.go.pcgogo.admin.model.vo.Admin;

public class AdminSingletone {
	private static AdminSingletone instance;
	private Admin admin;
	private Properties prop;
	
	private AdminSingletone(){
		try {
			prop = new Properties();
			String fileName = this.getClass().getResource("/admin.properties").getPath();
			prop.load(new FileReader(fileName));
			String adminId = prop.getProperty("adminId");
			String adminPassword = prop.getProperty("adminPassword");
			admin = new Admin(adminId, adminPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static AdminSingletone getInstance(){
		if(instance == null) instance = new AdminSingletone();
		return instance;
	}
	
	public Admin getAdmin() {
		return this.admin;
	}
}
