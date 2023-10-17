package mirae3.com;

public class d_07_pointTest extends Point {
	String color;

	public d_07_pointTest() {
		color = "검정";
	}

	public d_07_pointTest(String color, double x, double y) {
		super(x, y);
		this.color = color;
	}

	public String setColor(String color) {
		this.color = color;
		return color;
	}

	public String getColor() {
		return color;
	}

	public String toString() {
		return super.toString() + " color:" + color;
	}

}
