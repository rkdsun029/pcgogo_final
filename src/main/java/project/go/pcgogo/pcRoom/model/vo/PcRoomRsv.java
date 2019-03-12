package project.go.pcgogo.pcRoom.model.vo;

public class PcRoomRsv {
	private static final long serialVersionUID = 1L;
	
	private int pmPcRoomNo;
	private String pmFloor;
	private int pmRow;
	private int pmCol;
	private String pmContent;
	private int pmSeats;
	private String sitted;
	private String plProductName;
	private String plProductPrice;
	public PcRoomRsv() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PcRoomRsv(int pmPcRoomNo, String pmFloor, int pmRow, int pmCol, String pmContent, int pmSeats, String sitted,
			String plProductName, String plProductPrice) {
		super();
		this.pmPcRoomNo = pmPcRoomNo;
		this.pmFloor = pmFloor;
		this.pmRow = pmRow;
		this.pmCol = pmCol;
		this.pmContent = pmContent;
		this.pmSeats = pmSeats;
		this.sitted = sitted;
		this.plProductName = plProductName;
		this.plProductPrice = plProductPrice;
	}
	@Override
	public String toString() {
		return "PcRoomRsv [pmPcRoomNo=" + pmPcRoomNo + ", pmFloor=" + pmFloor + ", pmRow=" + pmRow + ", pmCol=" + pmCol
				+ ", pmContent=" + pmContent + ", pmSeats=" + pmSeats + ", sitted=" + sitted + ", plProductName="
				+ plProductName + ", plProductPrice=" + plProductPrice + "]";
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
	public String getSitted() {
		return sitted;
	}
	public void setSitted(String sitted) {
		this.sitted = sitted;
	}
	public String getPlProductName() {
		return plProductName;
	}
	public void setPlProductName(String plProductName) {
		this.plProductName = plProductName;
	}
	public String getPlProductPrice() {
		return plProductPrice;
	}
	public void setPlProductPrice(String plProductPrice) {
		this.plProductPrice = plProductPrice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
