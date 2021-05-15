package hack.fields;

public class Prices {
	public Prices() {
	}
	
	public Prices(String commodity, Integer min_price) {
		this.commodity = commodity;
		this.min_price = min_price;
	}

	public String commodity;
	public String state;
	public Integer min_price;
	public Integer max_price;
	public Integer modal_price;
	public String variety;
	public String district;
	public String path;
}
