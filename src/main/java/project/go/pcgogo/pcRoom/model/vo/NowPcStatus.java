package project.go.pcgogo.pcRoom.model.vo;

public class NowPcStatus {
	private String pcRoomName;
	private int totalSeat;
	private int usingSeat;
	private int unUsingSeat;
	public NowPcStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NowPcStatus(String pcRoomName, int totalSeat, int usingSeat, int unUsingSeat) {
		super();
		this.pcRoomName = pcRoomName;
		this.totalSeat = totalSeat;
		this.usingSeat = usingSeat;
		this.unUsingSeat = unUsingSeat;
	}
	@Override
	public String toString() {
		return "NowPcStatus [pcRoomName=" + pcRoomName + ", totalSeat=" + totalSeat + ", usingSeat=" + usingSeat
				+ ", unUsingSeat=" + unUsingSeat + "]";
	}
	public String getPcRoomName() {
		return pcRoomName;
	}
	public void setPcRoomName(String pcRoomName) {
		this.pcRoomName = pcRoomName;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
	public int getUsingSeat() {
		return usingSeat;
	}
	public void setUsingSeat(int usingSeat) {
		this.usingSeat = usingSeat;
	}
	public int getUnUsingSeat() {
		return unUsingSeat;
	}
	public void setUnUsingSeat(int unUsingSeat) {
		this.unUsingSeat = unUsingSeat;
	}
	
}
