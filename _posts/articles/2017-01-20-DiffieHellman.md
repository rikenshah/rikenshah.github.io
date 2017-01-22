---
layout: post
title: Diffie Hellman Algorithm
excerpt: "Implementing Diffie Hellman Algorithm"
categories: articles
tags: [Diffie Hellman, security, cryptography]
author: deesha_shah
comments: true
share: true
modified: 2017-01-05T14:18:57-04:00
published: true
---

# Diffie Hellman Algorithm Implementation in Java
## Client Code
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
			System.out.println("Enter x:");
			int x = sc.nextInt();
			int n=11, g=7;
			int a=((int)(Math.pow(g,x)))%n;
			String send=Integer.toString(a);
			dout.writeUTF(send); 
			DataInputStream dis=new DataInputStream(s.getInputStream());  
			String  str=(String)dis.readUTF();  
			int b=Integer.parseInt(str);
			int k1=((int)(Math.pow(b,x)))%n;
			System.out.println("Key generated:"+k1);
			dout.flush();  
			dout.close();  
			s.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);  
		}  
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
			System.out.println("Enter y:");
			int y = sc.nextInt();
			int n=11, g=7;
			int b=((int)(Math.pow(g,y)))%n;
			String  str=(String)dis.readUTF();  
			int a=Integer.parseInt(str);
			DataOutputStream dout=new DataOutputStream(s.getOutputStream()); 
			String send=Integer.toString(b);
			dout.writeUTF(send);
			int k2=((int)(Math.pow(a,y)))%n;
			System.out.println("Key generated:"+k2);
			dout.flush();  
			dout.close();   
			ss.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);  
		}  
	}
}
```
