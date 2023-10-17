package mirae3.com;

public class ColorPoint extends Point {
	String color;

	public ColorPoint() {
		color = "검정";
	}

	public ColorPoint(String color, double x, double y) {
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
