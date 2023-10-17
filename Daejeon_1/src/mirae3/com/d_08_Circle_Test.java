package mirae3.com;

public class d_08_Circle_Test {

	public static void main(String[] args) {
		ColorPoint po1 = new ColorPoint("노랑", 10, 1);
		ColorPoint po2 = new ColorPoint("파랑", 200, 200);
		System.out.println(po1);
		System.out.println(po2);
		Circle3 cl1 = new Circle3(100, po1);
		Circle3 cl2 = new Circle3(50, po2);
		
		System.out.println(cl1);
		System.out.println(cl2);
		
		System.out.println("두 점 사이의 거리는 =" + cl1.po.distanceTo(po2));
		if(cl1.collisionCheck(cl2)) {
			System.out.println("두 원은 충돌합니다");
		}else {
			System.out.println("두 원은 충돌하지 않습니다");
		}
			
		
		
	}

}
