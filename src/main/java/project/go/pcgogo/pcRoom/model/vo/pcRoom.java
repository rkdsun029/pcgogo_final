package project.go.pcgogo.pcRoom.model.vo;

public class pcRoom {
	
	private int pcNum;
	private String legend;
	private int sitNum;
	private String xLoc;
	private String yLoc;
	public pcRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public pcRoom(int pcNum, String legend, int sitNum, String xLoc, String yLoc) {
		super();
		this.pcNum = pcNum;
		this.legend = legend;
		this.sitNum = sitNum;
		this.xLoc = xLoc;
		this.yLoc = yLoc;
	}
	@Override
	public String toString() {
		return "pcRoom [pcNum=" + pcNum + ", legend=" + legend + ", sitNum=" + sitNum + ", xLoc=" + xLoc + ", yLoc="
				+ yLoc + "]";
	}
	public int getPcNum() {
		return pcNum;
	}
	public void setPcNum(int pcNum) {
		this.pcNum = pcNum;
	}
	public String getLegend() {
		return legend;
	}
	public void setLegend(String legend) {
		this.legend = legend;
	}
	public int getSitNum() {
		return sitNum;
	}
	public void setSitNum(int sitNum) {
		this.sitNum = sitNum;
	}
	public String getxLoc() {
		return xLoc;
	}
	public void setxLoc(String xLoc) {
		this.xLoc = xLoc;
	}
	public String getyLoc() {
		return yLoc;
	}
	public void setyLoc(String yLoc) {
		this.yLoc = yLoc;
	}

}
