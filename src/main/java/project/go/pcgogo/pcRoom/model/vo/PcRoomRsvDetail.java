package project.go.pcgogo.pcRoom.model.vo;

import java.util.Date;

public class PcRoomRsvDetail {
	private int reservedNo;
	private String pcRoomNo;
	private String memberId;
	private int reservedPcRoomNo;
	private String seatNo;
	private Date reservedTime;
	private Date reservedEndtime;
	private String timeSet;
	public PcRoomRsvDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PcRoomRsvDetail(int reservedNo, String pcRoomNo, String memberId, int reservedPcRoomNo, String seatNo,
			Date reservedTime, Date reservedEndtime, String timeSet) {
		super();
		this.reservedNo = reservedNo;
		this.pcRoomNo = pcRoomNo;
		this.memberId = memberId;
		this.reservedPcRoomNo = reservedPcRoomNo;
		this.seatNo = seatNo;
		this.reservedTime = reservedTime;
		this.reservedEndtime = reservedEndtime;
		this.timeSet = timeSet;
	}
	@Override
	public String toString() {
		return "PcRoomRsvDetail [reservedNo=" + reservedNo + ", pcRoomNo=" + pcRoomNo + ", memberId=" + memberId
				+ ", reservedPcRoomNo=" + reservedPcRoomNo + ", seatNo=" + seatNo + ", reservedTime=" + reservedTime
				+ ", reservedEndtime=" + reservedEndtime + ", timeSet=" + timeSet + "]";
	}
	public int getReservedNo() {
		return reservedNo;
	}
	public void setReservedNo(int reservedNo) {
		this.reservedNo = reservedNo;
	}
	public String getPcRoomNo() {
		return pcRoomNo;
	}
	public void setPcRoomNo(String pcRoomNo) {
		this.pcRoomNo = pcRoomNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getReservedPcRoomNo() {
		return reservedPcRoomNo;
	}
	public void setReservedPcRoomNo(int reservedPcRoomNo) {
		this.reservedPcRoomNo = reservedPcRoomNo;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public Date getReservedTime() {
		return reservedTime;
	}
	public void setReservedTime(Date reservedTime) {
		this.reservedTime = reservedTime;
	}
	public Date getReservedEndtime() {
		return reservedEndtime;
	}
	public void setReservedEndtime(Date reservedEndtime) {
		this.reservedEndtime = reservedEndtime;
	}
	public String getTimeSet() {
		return timeSet;
	}
	public void setTimeSet(String timeSet) {
		this.timeSet = timeSet;
	}
	
}
