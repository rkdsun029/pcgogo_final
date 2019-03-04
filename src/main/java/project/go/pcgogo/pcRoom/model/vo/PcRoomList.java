package project.go.pcgogo.pcRoom.model.vo;

public class PcRoomList {
	private String addressName;
	private String categoryGroupCode;
	private String categoryGroupName;
	private String categoryName;
	private String distance;
	private String id;
	private String phone;
	private String placeName;
	private String placeUrl;
	private String roadAddressName;
	private String x;
	private String y;
	public PcRoomList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PcRoomList(String addressName, String categoryGroupCode, String categoryGroupName, String categoryName,
			String distance, String id, String phone, String placeName, String placeUrl, String roadAddressName,
			String x, String y) {
		super();
		this.addressName = addressName;
		this.categoryGroupCode = categoryGroupCode;
		this.categoryGroupName = categoryGroupName;
		this.categoryName = categoryName;
		this.distance = distance;
		this.id = id;
		this.phone = phone;
		this.placeName = placeName;
		this.placeUrl = placeUrl;
		this.roadAddressName = roadAddressName;
		this.x = x;
		this.y = y;
	}
	@Override
	public String toString() {
		return "PcRoomList [addressName=" + addressName + ", categoryGroupCode=" + categoryGroupCode
				+ ", categoryGroupName=" + categoryGroupName + ", categoryName=" + categoryName + ", distance="
				+ distance + ", id=" + id + ", phone=" + phone + ", placeName=" + placeName + ", placeUrl=" + placeUrl
				+ ", roadAddressName=" + roadAddressName + ", x=" + x + ", y=" + y + "]";
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getCategoryGroupCode() {
		return categoryGroupCode;
	}
	public void setCategoryGroupCode(String categoryGroupCode) {
		this.categoryGroupCode = categoryGroupCode;
	}
	public String getCategoryGroupName() {
		return categoryGroupName;
	}
	public void setCategoryGroupName(String categoryGroupName) {
		this.categoryGroupName = categoryGroupName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceUrl() {
		return placeUrl;
	}
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	public String getRoadAddressName() {
		return roadAddressName;
	}
	public void setRoadAddressName(String roadAddressName) {
		this.roadAddressName = roadAddressName;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	
	
}
