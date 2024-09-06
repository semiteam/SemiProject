package semi.landmark.model.vo;

public class Landmark {
	private int landmarkNo;
	private String landmarkName;
	private String landmarkCity;

	public Landmark() {
	}

	public Landmark(int landmarkNo, String landmarkName, String landmarkCity) {
		super();
		this.landmarkNo = landmarkNo;
		this.landmarkName = landmarkName;
		this.landmarkCity = landmarkCity;
	}

	public Landmark(String landmarkName, String landmarkCity) {
		super();
		this.landmarkName = landmarkName;
		this.landmarkCity = landmarkCity;
	}

	public int getLandmarkNo() {
		return landmarkNo;
	}

	public void setLandmarkNo(int landmarkNo) {
		this.landmarkNo = landmarkNo;
	}

	public String getLandmarkName() {
		return landmarkName;
	}

	public void setLandmarkName(String landmarkName) {
		this.landmarkName = landmarkName;
	}

	public String getLandmarkCity() {
		return landmarkCity;
	}

	public void setLandmarkCity(String landmarkCity) {
		this.landmarkCity = landmarkCity;
	}

	@Override
	public String toString() {
		return "Landmark [landmarkNo=" + landmarkNo + ", landmarkName=" + landmarkName + ", landmarkCity="
				+ landmarkCity + "]";
	}
}
