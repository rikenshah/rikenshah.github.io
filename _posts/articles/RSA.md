---
layout: post
title: RSA Algorithm
excerpt: "Implementing RSA Algorithm"
categories: articles
tags: [RSA, security, cryptography]
author: deesha_shah
comments: true
share: true
modified: 2017-01-05T14:18:57-04:00
published: true
---

# RSA Algorithm implementation in java

## Client
#### MyClient.java

```javascript
import java.io.*;  
import java.net.*; 
import java.util.*; 
public class MyClient {  
	public static void main(String[] args) {  
		try{      
			Socket s=new Socket("localhost",6666);  
			Scanner sc = new Scanner(System.in);
			DataOutputStream dout=new DataOutputStream(s.getOutputStream());  
			int p=3,q=7;
			int n=p*q;
			int fi=(p-1)*(q-1);
			System.out.println("Enter the value for e");
			int e=sc.nextInt();
			while(true)
			{
				if(findGCD(fi,e)!=1)
				{
					System.out.println("Enter a valid value for e");
					e=sc.nextInt();
				}
				else
					break;
			}
			int d= findD(e,fi);
			System.out.println(d);
			dout.writeUTF(Integer.toString(d));
			System.out.println("Enter plain text(number):");
			int m=sc.nextInt();
			int c= (int)(Math.pow(m,e))%n;
			System.out.println("Cipher text is: "+c);
			String send=Integer.toString(c);
			dout.writeUTF(send);
			dout.flush();  
			dout.close();  
			s.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);  
		}  
	}
	static int findD(int e, int fi)
	{
		int x;
		int i=1;
		for(i=1;i<fi;i++)
		{
			x=(i*e)%fi;
			if(x==1){
				break;			}
		}

		return i;
	}

	static int findGCD(int number1, int number2) {
//base case
		if(number2 == 0){
			return number1;
		}
		return findGCD(number2, number1%number2);
	} 
}
```

## Server Code
#### MyServer.java
```javascript
import java.io.*;  
import java.net.*;
import java.util.*;  
public class MyServer {  
	public static void main(String[] args){  
		try{  
			ServerSocket ss=new ServerSocket(6666);  
			Scanner sc=new Scanner(System.in);
			Socket s=ss.accept();
			DataInputStream dis=new DataInputStream(s.getInputStream());  
			long p=3L, q=7L;
			long n=p*q;
			String  str=(String)dis.readUTF();  
			long d=Long.parseLong(str);
			System.out.println("D="+d);
			String  str1=(String)dis.readUTF();
			long c=Long.parseLong(str1);  
			System.out.println("Received:"+c);
			long pt= (long)(Math.pow(c,d))%n;
			System.out.println("Decrypted: "+pt);
			ss.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);  
		}  
	}
}

```
