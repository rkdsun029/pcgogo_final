package project.go.pcgogo.manager.model.vo;

public class PriceList {
	private int plPcRoomNo;
	private int pl1000;
	private int pl2000;
	private int pl3000;
	private int pl5000;
	private int pl10000;
	private int pl20000;
	private int pl30000;
	private int pl50000;
	
	public PriceList() {}
	
	public PriceList(int plPcRoomNo, int pl1000, int pl2000, int pl3000, int pl5000, int pl10000, int pl20000,
			int pl30000, int pl50000) {
		super();
		this.plPcRoomNo = plPcRoomNo;
		this.pl1000 = pl1000;
		this.pl2000 = pl2000;
		this.pl3000 = pl3000;
		this.pl5000 = pl5000;
		this.pl10000 = pl10000;
		this.pl20000 = pl20000;
		this.pl30000 = pl30000;
		this.pl50000 = pl50000;
	}

	@Override
	public String toString() {
		return "PriceList [plPcRoomNo=" + plPcRoomNo + ", pl1000=" + pl1000 + ", pl2000=" + pl2000 + ", pl3000="
				+ pl3000 + ", pl5000=" + pl5000 + ", pl10000=" + pl10000 + ", pl20000=" + pl20000 + ", pl30000="
				+ pl30000 + ", pl50000=" + pl50000 + "]";
	}
	
	public int getPlPcRoomNo() {
		return plPcRoomNo;
	}
	public void setPlPcRoomNo(int plPcRoomNo) {
		this.plPcRoomNo = plPcRoomNo;
	}
	public int getPl1000() {
		return pl1000;
	}
	public void setPl1000(int pl1000) {
		this.pl1000 = pl1000;
	}
	public int getPl2000() {
		return pl2000;
	}
	public void setPl2000(int pl2000) {
		this.pl2000 = pl2000;
	}
	public int getPl3000() {
		return pl3000;
	}
	public void setPl3000(int pl3000) {
		this.pl3000 = pl3000;
	}
	public int getPl5000() {
		return pl5000;
	}
	public void setPl5000(int pl5000) {
		this.pl5000 = pl5000;
	}
	public int getPl10000() {
		return pl10000;
	}
	public void setPl10000(int pl10000) {
		this.pl10000 = pl10000;
	}
	public int getPl20000() {
		return pl20000;
	}
	public void setPl20000(int pl20000) {
		this.pl20000 = pl20000;
	}
	public int getPl30000() {
		return pl30000;
	}
	public void setPl30000(int pl30000) {
		this.pl30000 = pl30000;
	}
	public int getPl50000() {
		return pl50000;
	}
	public void setPl50000(int pl50000) {
		this.pl50000 = pl50000;
	}
}
