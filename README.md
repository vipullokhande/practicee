# Efficiently handle API Integration in Flutter Apps
final data = await http.get(uri);
final json = await Isolate.run(()=>jsonDecode(response.body));

# JAVA BASICS
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Random;
public class Main {
	public static void main(String[] args) {
		// Print Statement
		System.out.println("Hello World");
		
		
		//Variables (Data types) - (1.Primitive ,2.Reference )
		//Primitive - simple value stored in memory (stack)
		//Reference - memory address that points to the location (heap)
		
		//Primitive Data types
		int age=25;
		char sex='M';
		float gpa=7.0f;
		double gpa2=7.0;
		boolean isMale=true;
		long lognNumber=200000000;
		
		//Reference data types
		String name="Vipul";
		//arr
		//obj
		
		
		//final - once assigned then never changes
		final double PI=3.14;
		System.out.println(PI);
		
		//Concatenation
		System.out.println("Your name is "+name+" You are "+ age +" years old");
		
		
		//Scanner - accepting user input
		//import java.util.Scanner; (at top)
//		Scanner scanner=new Scanner(System.in);
//		System.out.println("Enter your name : ");
//		String enteredName=scanner.nextLine();
//		System.out.println("Enter your age : ");
//		int enteredAge=scanner.nextInt();
//		System.out.println(enteredName);
//		System.out.println(enteredAge);
//		scanner.close();
		
		
		//Arithmetic operators
		int x=5,y=10,z;
//		z=x+y;
//		z=x-y;
//		z=x*y;
//		z=x/y;
//		z=x%y;
		
		
		//if statements
		String collegeName="Konkan Gyanpeeth College of Engineering";
		if (collegeName.isEmpty()) {
			System.out.println("Name is empty");
		}else if(collegeName.toLowerCase().contains("konkan")) {
			System.out.println("Found");
		}else if(collegeName.length()<5) {
			System.out.println("Less than 5");
		}else {
			System.out.println(collegeName);
		}
		
		
		//Random number
		//import java.util.Random; - (at top)
		Random random=new Random();
		int randomDiceNumber=random.nextInt(1,7);//second number is exclusive
		System.out.println("You rolled "+randomDiceNumber);
		
		
		//Built in Math functions
		double result;
		result=Math.pow(2,2);//4
		result=Math.sqrt(9);//3
		result=Math.min(2, 3);//2
		result=Math.max(2, 3);//3
		result=Math.abs(-5);//5
		result=Math.round(3.14);//3
		result=Math.ceil(3.1);//4
		result=Math.floor(3.9);//3
		System.out.println(result);
		
		
		//String methods
		String cityString="Ambarnath";
		System.out.println(cityString.charAt(0));//A
		System.out.println(cityString.length());//9
		System.out.println(cityString.indexOf("A"));//0
		System.out.println(cityString.toLowerCase());//ambarnath
		System.out.println(cityString.isEmpty());//false
		System.out.println(cityString.contains("T"));//false - because t is present in lowercase
		System.out.println(cityString=="Ambarnath");//true
		System.out.println(cityString.equals("Ambarnath"));//true
		System.out.println(cityString.substring(0,5));//Ambar - second index is exclusive
		System.out.println(cityString.substring(0,cityString.indexOf("n")));//Ambar
		
		
		//Ternary operator
		System.out.println(0==0?"Equal":"Not equal");//Equal
		System.out.println(0>10?"Greater":0==0?"Equal":"Not equal");//Equal
		
		
		//switch statements
		String dayString="Monday";
		switch(dayString) {
			case "Monday","Tuesday","Wednesday","Thursday","Friday":
				System.out.println("Weekday");
				break;
			case "Saturday","Sunday":
				System.out.println("Weekend");
				break;
			default:
				System.out.println("Not a day");
		}
		switch(dayString.length()) {
			case 6,7->{
				System.out.println("Smaller");
			}
			case 8,9->{
				System.out.println("Bigger");
			}
			default->{
				System.out.println("None");
			}
		}
		
		
		//logical operators
		// &&
		// ||
		// !
		String trainNumber="12345";
		if (trainNumber.length()>1 && trainNumber.contains("1")) {
			System.out.println("Present");
		}
		
		
		//while loops
		int num=1;
		while (num<10) {
			if(num==5) {
				num++;
				//add this after main if you want to use thread class throws InterruptedException
//				Thread.sleep(1000);
				continue;
			}
			else if(num==8)
				break;
			System.out.println(num);
			num++;
//			Thread.sleep(1000);
		}
		
		
		//for loops
		for (int i = 0; i < 3; i++) {
			System.out.println(i);
		}
		int[] nums= {1,2,3};
		for(int i:nums) {
			System.out.println(i);
		}
		
		
		//method overloading
		//look outside main function
		printName(0);
		printName("Vipul");
		printName("Vipul", 25);
		
		
		//Arrays (1d and 2d)
		String[] fruitStrings= {"Apple","Coconut","Banana"};
		fruitStrings[0]="APPLE";
		System.out.println(fruitStrings.length);
		//for sorting array add import at top
		//import java.util.Arrays
		Arrays.sort(fruitStrings);
		for(String fruit:fruitStrings) {
			System.out.println(fruit);
		}
		int[][] telephone= {{1,2,3},{4,5,6},{7,8,9}};
		for (int[] numbers : telephone) {
			for (int number : numbers) {
				System.out.print(number+" ");
			}
			System.out.println();
		}
		
		
		//Object Oriented Programming
		//Object - reference data type that acts as entity that holds data (attributes) 
		//		   and can perform actions (methods)
		//class blueprint
		//inner class
		class User{
			//static varibale
			static int numberOfUsers;
			//atrributes
			String name;
			String email;
			int age;
			//Constructor
			User(String name){
				this.name=name;
				this.email="None";
				this.age=0;
				numberOfUsers++;
			}
			//overloaded constructors
			//1
			User(int age){
				this.name="None";
				this.email="None";
				this.age=age;
				numberOfUsers++;
			}
			//2
			User(String name,int age){
				this.name=name;
				this.email="None";
				this.age=age;
				numberOfUsers++;
			}
			@Override
			public String toString() {
				System.out.println(name+" "+age+" "+email);
				return name+age+email;
			}
			//static method
			static void printNumberOfUsersLength() {
				System.out.println(numberOfUsers);
			}
		}
		//Create instance of class 
		User user1=new User("Vipul");
		User user2=new User(25);
		User.printNumberOfUsersLength();//2
		User[] users= {new User("Vipul"),user2};
		for(User user:users) {
			System.out.println(user.name);//"Vipul","None"
		}
		
		
		//inheritance
		//Single inheritance
		class Animal1{
			int legs;
			String color;
			//java default initializes value to false
			boolean isAnimal;
			public Animal1(int legs,String color) {
				this.legs=legs;
				this.color=color;
				System.out.println("This is animal");
			}
			public void speak() {
				System.out.println("Animal is speaking");
			}
		}
		class Dog extends Animal1{
			int price;
			public Dog(int legs,String color,int price) {
				//super keyword inherits from parent class attributes and methods
				super(legs,color);
				this.price=price;
				super.speak();
				System.out.println(super.isAnimal);
			}
		}
		Dog dog=new Dog(4,"White",20000);
		//This is animal
		//Animal is speaking
		
		//Multiple inheritance (java dont support multiple inheritance but it can done using interfaces)
		//interface
		interface BlackAnimal{
			void black();
		}
		interface WhiteAnimal{
			void white();
		}
		class Cat implements BlackAnimal,WhiteAnimal{

			@Override
			public void white() {
				System.out.println("White");
			}

			@Override
			public void black() {
				System.out.println("Black");
			}
		}
		
		//Multilevel inheritance
		class Organism{
			
		}
		class Animal2 extends Organism{
			
		}
		class Dog2 extends Animal2{
			
		}
		
		//hierarchical inheritance
		class Base{
			
		}
		class Base1 extends Base{
			
		}
		class Base2 extends Base{
			
		}
		
		//hybrid inheritance - (combination of two or more types of inheritance)
		//					 - (it only supports through interfaces)
		interface Animal3{
			void eat();
		}
		class Dog3{
			void bark() {
				System.out.println("BARKING");
			}
		}
		class Puppy extends Dog3 implements Animal3{
			@Override
			public void eat() {
				System.out.println("EATING");
			}
		}
		
		
		//abstraction - process of hiding implementation and showing only essential details
		abstract class Shape{
			//abstract method declaration
			abstract double area();
			//concrete method
			void display() {
				System.out.println("This is a shape");
			}
		}
		class Circle extends Shape{
			//abstract method implementation
			@Override
			public double area() {
				return 0;
			}
		}
		class Triangle extends Shape{
			//abstract method implementation
			@Override
			public double area() {
				return 0;
			}
			//method overriding
			@Override
			public void display() {
				System.out.println("This is Triangle");
			}
		}
		Circle circle=new Circle();
		Triangle triangle=new Triangle();
		System.out.println(circle.area());
		System.out.println(triangle.area());
		circle.display();
		triangle.display();
		
		
		//interfaces - blueprint for class that specifies abstract methods that implementing class must define
		interface Prey{
			void flee();
		}
		interface Predator{
			void hunt();
		}
		class Butterfly implements Prey{
			@Override
			public void flee() {
				System.out.println("butterfly is fleeing");
			}
		}
		class Snake implements Predator{
			@Override
			public void hunt() {
				System.out.println("Snake is hunting");
			}
		}
		class Fish implements Prey, Predator{
			@Override
			public void hunt() {
				System.out.println("Fish is hunting");
			}

			@Override
			public void flee() {
				System.out.println("Fish is fleeing");
			}
		}
		Butterfly butterfly=new Butterfly();
		Snake snake=new Snake();
		Fish fish=new Fish();
		butterfly.flee();
		snake.hunt();
		fish.flee();
		fish.hunt();
		
		//polymorphism - an object that has many forms
		//it can be achieved through inheritance and interface
		//1.Compile time polymorphism (method overloading)
		//it happens when multiple methods has same name and different data types or number of arguments
		class Car{
			void drive() {
				System.out.println("Car is moving");
			}
			void drive(int speed) {
				System.out.println("Car is moving at speed "+speed);
			}
		}
		//2.Runtime polymorphism (method overriding)
		//subclass provides specific implementation of method defined in parent class
		//example through inheritance
		abstract class Animal4{
			abstract void speak();
		}
		class Dog5 extends Animal4{
			@Override
			void speak() {
				System.out.println("Dog is barking");
			}
		}
		//example through interface
		interface Paymentmethod{
			void processpayment();
		}
		class Paypal implements Paymentmethod{
			@Override
			public void processpayment() {
				System.out.println("Paypal is processing payment");
			}
		}
		
		
		//Encapsulation - restricting direct access of data and give access via getter and setters methods
		class Man{
			private int age;
			Man(int age){
				this.age=age;
			}
			public void setAge(int age) {
				this.age=age;
			}
			public int getAge() {
				return this.age;
			}
		}
		Man man=new Man(24);
		man.setAge(25);
		System.out.println(man.getAge());
		
		
		//Wrapper class - allows primitives to be used as objects
		//autoboxing - converting primitive to object using wrapper class
		Integer a=100;
		Character b='C';
		Boolean c=true;
		
		//unboxing - converting wrapper class into primitive
		int xx=a;
		char yy=b;
		boolean cc=c;
		
		//converting wrapper class in string
		String aa=Integer.toString(120);
		String bb=Double.toString(3.0);
		String bbb=Character.toString('C');
		String bbbb=Boolean.toString(true);
		int ans1=Integer.parseInt("123");
		double ans2=Double.parseDouble("123.8");
		
		
		//ArrayList - a resizable array that stores objects
		//add import at top - import java.util.ArrayList;
		//add import at top - import java.util.Collections; for sorting
		ArrayList<String> fruitss=new ArrayList<>();
		fruitss.add("Apple");
		fruitss.add(0,"pineapple");
		System.out.println(fruitss);
		fruitss.set(0, "Pineapple");
		fruitss.add("Mango");
		fruitss.add("Banana");
		fruitss.add("Carrot");
		System.out.println(fruitss);
		fruitss.remove(0);
		fruitss.remove("Carrot");
		System.out.println(fruitss);
		System.out.println(fruitss.get(0));
		System.out.println(fruitss);
		System.out.println(fruitss.contains("Banana"));
		System.out.println(fruitss.size());
		Collections.sort(fruitss);
		System.out.println(fruitss);
		
		
		//Exception handling
		try {
			System.out.println(1/0);
		}catch(Exception e) {
			System.out.println(e.toString());
		}finally {
			System.out.println("Code executed");
		}
		
		
		//Generics - a concept where you can write a class ,interface ,method 
//					that is compatible with different data types
		class Human<T>{
			T data;
			public void setData(T data) {
				this.data=data;
			}
			public T getData() {
				return this.data;
			}
		}
		Human<String> human=new Human<>();
		human.setData("Man");
		System.out.println(human.getData());
		System.out.println(human.data);
		class TeslaCar<T,U>{
			T details;
			U price;
			TeslaCar(T details,U price){
				this.details=details;
				this.price=price;
			}
			public T getDetails() {
				return this.details;
			}
			public U getPrice() {
				return this.price;
			}
		}
		TeslaCar<String,Integer> teslaCar=new TeslaCar("Tesla", 20000);
		System.out.println(teslaCar.getDetails());
		System.out.println(teslaCar.getPrice());
		System.out.println(teslaCar.details);
		System.out.println(teslaCar.price);
		
		
		//Hashmaps - a collection of key-value pairs (part of Collections framework)
		HashMap<String, Integer> map=new HashMap<>();
		map.put("one", 11);
		map.put("one", 1);
		System.out.println(map);
		int one=map.get("one");
		System.out.println(one);
		System.out.println(map.containsKey("one"));
		System.out.println(map.containsValue(1));
		System.out.println(map.size());
		map.remove("one");
		//check if value is matched
		map.remove("one",1);
		System.out.println(map);
		map.put("two", 2);
		map.put("three", 3);
		for(String key:map.keySet()) {
			System.out.println(key+" : "+map.get(key));
		}
		map.forEach((key,value)->{
			System.out.println(key + ": " + value);
		});
		
		
		//Access modifiers - default,public,private,protected
		//default - only accessible within same package 
		//        - also if class is default then it is only accessible in same package
		//public - can be accessed in different packages
		//private - only accessed in class that it contains
		//protected - class that extends those classes can access in any package
		
		
		//Threading - allow a program to run multiple tasks Simultaneously
//		class MyRunnable implements Runnable{
//			@Override
//			public void run() {
//				for (int i = 1; i <= 5; i++) {
//					try {
//						Thread.sleep(1000);
//					} catch (Exception e) {
//						System.out.println("Thread was interrupted");
//					}
//					if(i==5) {
//						System.out.println("Time up");
//						//stops the program completely
//						System.exit(0);
//					}
//				}
//			}
//		}
//		Scanner sc1=new Scanner(System.in);
//		MyRunnable myRunnable=new MyRunnable();
//		Thread thread=new Thread(myRunnable);
//		//setDaemon sets the thread ends when main thread is over
//		thread.setDaemon(true);
//		thread.start();
//		System.out.println("You have 5 seconds to enter your name");
//		System.out.println("Enter your name");
//		String nameEntered=sc1.nextLine();
//		System.out.println("Hello "+nameEntered);
//		sc1.close();
		
		
		//MultiThreading
		class MyRunnable2 implements Runnable{
			private final String text;
			public MyRunnable2(String text) {
				this.text=text;
			}
			@Override
			public void run() {
				for (int i = 1; i <= 5; i++) {
					try {
						Thread.sleep(1000);
						System.out.println(this.text);
					} catch (Exception e) {
						System.out.println("Thread was interrupted");
					}
				}
			}
		}
		Thread thread1=new Thread(new MyRunnable2("PING"));
		Thread thread2=new Thread(new MyRunnable2("PONG"));
		System.out.println("GAME START");
		thread1.start();
		thread2.start();
		try {
			//Main thread waits for these two threads to finish
			thread1.join();
			thread2.join();
		} catch (Exception e) {
			System.out.println("Main thread was interrupted");
		}
		System.out.println("GAME OVER");
	}
	//method overloading
	static void printName(String name) {
		System.out.println(name);
	}
	static void printName(int name) {
		System.out.println(name);
	}
	static void printName(String name,int age) {
		System.out.println(name+ " "+ age);
	}
}
