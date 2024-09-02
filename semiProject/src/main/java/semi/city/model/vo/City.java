package semi.city.model.vo;

public class City {
	private int cityNo;
	private String cityName;
	private String cityCountry;
	
	public City() {}

	public City(int cityNo, String cityName, String cityCountry) {
		super();
		this.cityNo = cityNo;
		this.cityName = cityName;
		this.cityCountry = cityCountry;
	}

	public City(String cityName, String cityCountry) {
		super();
		this.cityName = cityName;
		this.cityCountry = cityCountry;
	}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityCountry() {
		return cityCountry;
	}

	public void setCityCountry(String cityCountry) {
		this.cityCountry = cityCountry;
	}

	@Override
	public String toString() {
		return "City [cityNo=" + cityNo + ", cityName=" + cityName + ", cityCountry=" + cityCountry + "]";
	}
}
