package project.go.pcgogo.manager.model.vo;

import java.io.Serializable;

public class PcRoomPlacement implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int pmPcRoomNo;
	private int pmFloor;
	private int pmRow;
	private int pmCol;
	private String pmContent;
	
	public PcRoomPlacement(){}
	
	public PcRoomPlacement(int pmPcRoomNo, int pmFloor, int pmRow, int pmCol, String pmContent) {
		super();
		this.pmPcRoomNo = pmPcRoomNo;
		this.pmFloor = pmFloor;
		this.pmRow = pmRow;
		this.pmCol = pmCol;
		this.pmContent = pmContent;
	}
	
	@Override
	public String toString() {
		return "PcRoomPlacement [pmPcRoomNo=" + pmPcRoomNo + ", pmFloor=" + pmFloor + ", pmRow=" + pmRow + ", pmCol="
				+ pmCol + ", pmContent=" + pmContent + "]";
	}

	public int getPmPcRoomNo() {
		return pmPcRoomNo;
	}
	public void setPmPcRoomNo(int pmPcRoomNo) {
		this.pmPcRoomNo = pmPcRoomNo;
	}
	public int getPmFloor() {
		return pmFloor;
	}
	public void setPmFloor(int pmFloor) {
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
}
