---
layout: post
title: Caesar Cipher
excerpt: "Implementing Caesar Cipher"
categories: articles
tags: [nltk, python, nlp]
author: deesha_shah
comments: true
share: true
modified: 2017-01-05T14:18:57-04:00
published: true
---

# Caesar Cipher in Java

## Client code
#### client.java

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
			System.out.println("Enter a message to be sent to server..!");
			String message = sc.next();
			String temp="";
			for(int i=0;i<message.length();i++)
			{
				int ch=(int)message.charAt(i);
				ch=(ch+3)%122;
				char c=(char)ch;
				temp=temp+c;
			}
			System.out.println("Encrypted:"+temp);
			dout.writeUTF(temp); 
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
## Server code
#### server.java
```javascript
import java.io.*;  
import java.net.*;  
public class MyServer {  
	public static void main(String[] args){  
		try{  
			ServerSocket ss=new ServerSocket(6666);  
			Socket s=ss.accept();
			DataInputStream dis=new DataInputStream(s.getInputStream());  
			String  str=(String)dis.readUTF();  
			System.out.println("Recieved: "+str);
			String temp="";
			for(int i=0;i<str.length();i++)
			{
				int ch=(int)str.charAt(i);
				char c= (char)((ch-3)%122);
				temp=temp+c;
			}  
			System.out.println("decrypted:"+temp);
			ss.close();  
		}

		catch(Exception e)
		{
			System.out.println(e);  
		}  
	}
}  
```
