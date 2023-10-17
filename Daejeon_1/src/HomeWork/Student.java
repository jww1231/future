package HomeWork;

import java.util.Scanner;

import mirae2.com.Person;

public class Student {
	String name;
	int kor;
	int eng;
	int mat;
	int total;
	int average;
	
	public Student() {} // 내가 빠뜨린거 생성자 

	public Student(String name, int kor, int eng, int mat)

	{
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		totCalc();
		avrCalc();

	}
	public Student(String name ) { // 내가 빠뜨린거
		this.name = name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setKor(int kor) {
		this.kor = kor;

	}

	public int getKor() {
		return kor;

	}

	public void setEng(int eng) {
		this.eng = eng;

	}

	public int getEng() {

		return eng;
	}

	public void setMat(int mat) {
		this.mat = mat;

	}

	public int getMath() {
		return mat;

	}
	public void print() {
		System.out.println("이름은 " + name + " 국어점수는 " + kor + " 영어점수는 "
	+ eng  + " 수학점수는 " + mat + " " +total + " " + average);
	}

	public void totCalc() {
		total = kor + eng + mat;
	}

	public void avrCalc() {
		average = total / 3;
	}
	public void setNamescore(String name, int kor, int eng, int mat) {
		this.name = name ; 
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		totCalc();
		avrCalc();
	}
	
	public String getNamescore() {
		return name + " " + kor + " " + eng + " " + mat + " 총점: " + total + ", 평균: "+ average;
	}
	
	
	
}


