package com.sungjuk;

public class SungjukDto {
	public int bunho;
	private String name;
	private int kor;
	private int mat;
	private int eng;
	private int total;
	private float average;
	private char grade;
	private String schoolcode;

	public SungjukDto() {
	} // 디폴트 생성자 (배열할 때 필요)

	public SungjukDto(int bunho, String name, int kor, int mat, int eng, int total, float average, char grade,
			String schoolcode) {
		super();
		this.bunho = bunho;
		this.name = name;
		this.kor = kor;
		this.mat = mat;
		this.eng = eng;
		this.total = total;
		this.average = average;
		this.grade = grade;
		this.schoolcode = schoolcode;
	}

	public SungjukDto(int bunho, String name, int kor, int mat, int eng, String schoolcode) {
		super();
		this.bunho = bunho;
		this.name = name;
		this.kor = kor;
		this.mat = mat;
		this.eng = eng;
		this.schoolcode = schoolcode;
	}

	public String getSchoolcode() {
		return schoolcode;
	}

	public void setSchoolcode(String schoolcode) {
		this.schoolcode = schoolcode;
	}

	public int getBunho() {
		return bunho;
	}

	public void setBunho(int bunho) {
		this.bunho = bunho;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public float getAverage() {
		return average;
	}

	public void setAverage(float average) {
		this.average = average;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

}
