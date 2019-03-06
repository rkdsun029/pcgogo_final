package project.go.pcgogo.manager.model.vo;

import java.io.Serializable;

public class Placement implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int pmPcRoomNo;
	private String pmFloor;
	private int pmRow;
	private int pmCol;
	private int pmSeats;
	private String pmContent;
	
	public Placement(){}
	
	public Placement(int pmPcRoomNo, String pmFloor, int pmRow, int pmCol, int pmSeats, String pmContent) {
		super();
		this.pmPcRoomNo = pmPcRoomNo;
		this.pmFloor = pmFloor;
		this.pmRow = pmRow;
		this.pmCol = pmCol;
		this.pmSeats = pmSeats;
		this.pmContent = pmContent;
	}

	@Override
	public String toString() {
		return "Placement [pmPcRoomNo=" + pmPcRoomNo + ", pmFloor=" + pmFloor + ", pmRow=" + pmRow + ", pmCol=" + pmCol
				+ ", pmSeats=" + pmSeats + ", pmContent=" + pmContent + "]";
	}

	public int getPmPcRoomNo() {
		return pmPcRoomNo;
	}
	public void setPmPcRoomNo(int pmPcRoomNo) {
		this.pmPcRoomNo = pmPcRoomNo;
	}
	public String getPmFloor() {
		return pmFloor;
	}
	public void setPmFloor(String pmFloor) {
		this.pmFloor = pmFloor;
	}
	public int getPmRow() {
		return pmRow;
	}
	public void setPmRow(int pmRow) {
		this.pmRow = pmRow;
	}
	public int getPmCol() {
		return pmCol;
	}
	public void setPmCol(int pmCol) {
		this.pmCol = pmCol;
	}
	public String getPmContent() {
		return pmContent;
	}
	public void setPmContent(String pmContent) {
		this.pmContent = pmContent;
	}
	public int getPmSeats() {
		return pmSeats;
	}
	public void setPmSeats(int pmSeats) {
		this.pmSeats = pmSeats;
	}
}
