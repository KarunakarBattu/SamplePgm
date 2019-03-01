package com.constructor.java;

public class Test1 {
	int a, b;

	public static void main(String[] args) {

		Test1 ob = new Test1(1, 0);
		 //ob.Test1(2, 3);
		 Test1 ob1 = new Test1(1, 1);
		 
		 Test1 ob2 = new Test1();
		 ob2.Test1(2, 1.23);
		 ob2.Test1(1, "Battu");

	}

	// Syntax for default constructor
	public Test1() {
		System.out.println("I am default constructor");
	}

	// Syntax for Parameterized constructor
	public Test1(int a, int b) {
		// this keyword will be used when there is a situation like Class/Instance/Global variables name and local variables are same
		//and when initialization will use this keyword to assign local variables value to class variables
		this.a = a;
		this.b = b;
		System.out.println("I am parameterized constructor");
		System.out.println("a value is : " + a + " b value is : " + b);
	}

	// Constructor overloading is possible or not ?? - Answer - Yes
	//Explanation : Passing different number of arguments to the same constructor name
	public void Test1(int a, int k) {
		System.out.println("Constructor overloading 1");
		System.out.println("a value is : " + a + " k value is : " + k);
	}
	
	public void Test1(int a, double k) {
		System.out.println("Constructor overloading 2");
		System.out.println("a value is : " + a + " k value is : " + k);
	}
	public void Test1(int a, String k) {
		System.out.println("Constructor overloading 3");
		System.out.println("a value is : " + a + " k value is : " + k);
	}
}
