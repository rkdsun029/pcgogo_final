package project.go.pcgogo.pcRoom.model.vo;

public class PcRoomRsv {
	private static final long serialVersionUID = 1L;
	
	private int pmPcRoomNo;
	private String pmFloor;
	private int pmRow;
	private int pmCol;
	private String pmContent;
	private int seatCount;
	private String seated;
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
	public int getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}
	public String getSeated() {
		return seated;
	}
	public void setSeated(String seated) {
		this.seated = seated;
	}
	@Override
	public String toString() {
		return "PcRoomRsv [pmPcRoomNo=" + pmPcRoomNo + ", pmFloor=" + pmFloor + ", pmRow=" + pmRow + ", pmCol=" + pmCol
				+ ", pmContent=" + pmContent + ", seatCount=" + seatCount + ", seated=" + seated + "]";
	}
	public PcRoomRsv(int pmPcRoomNo, String pmFloor, int pmRow, int pmCol, String pmContent, int seatCount,
			String seated) {
		super();
		this.pmPcRoomNo = pmPcRoomNo;
		this.pmFloor = pmFloor;
		this.pmRow = pmRow;
		this.pmCol = pmCol;
		this.pmContent = pmContent;
		this.seatCount = seatCount;
		this.seated = seated;
	}
	public PcRoomRsv() {
		super();
		// TODO Auto-generated constructor stub
	}
}
