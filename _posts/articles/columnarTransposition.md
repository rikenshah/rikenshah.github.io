---
layout: post
title: Columnar Transposition
excerpt: "Implementing Transposition"
categories: articles
tags: [playfair, security, cryptography]
author: deesha_shah
comments: true
share: true
modified: 2017-01-05T14:18:57-04:00
published: true
---

# Columnar transposition using Java

## Client code
#### MyClient.java

```javascript
//number of columns: 6
//cipher sequence: 4,5,1,3,6,2
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
			String message = sc.nextLine();
			String temp="";
			message=message.replaceAll("\\s+",""); 
			int l=message.length();
			int row=(l/6)+1;
			System.out.println(row);
			char a[][]=new char[row][6];
			int k=0;
			for(int i=0;i<row;i++)
			{
				for(int j=0;j<6;j++)
				{
					if(k<message.length())
					{
						a[i][j]=message.charAt(k);
						k++;
					}
					else
						a[i][j]=' ';
				}
			}
			for(int i=0;i<row;i++)
			{
				for(int j=0;j<6;j++)
				{
					System.out.print(a[i][j]);
				}
				System.out.println();
			}
			String str="";
			System.out.println("Encrypted (4,5,1,3,6,2):");
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][3]);
				str+=a[j][3];

			}
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][4]);
				str+=a[j][4];
			}
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][0]);
				str+=a[j][0];

			}
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][2]);
				str+=a[j][2];

			}
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][5]);
				str+=a[j][5];

			}
			for(int j=0;j<row;j++)
			{
				System.out.print(a[j][1]);
				str+=a[j][1];

			}
			System.out.println();
			System.out.println(str);
			dout.writeUTF(str); 
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
#### MyServer.java

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
			int l=str.length();
			int row=(l/6);
			char a[][]=new char[row][6];
			int k=0;
			for(int i=0;i<row;i++) 
			{
				a[i][3]=str.charAt(k);
				k++;
			}  
			for(int i=0;i<row;i++) 
			{
				a[i][4]=str.charAt(k);
				k++;
			}  
			for(int i=0;i<row;i++) 
			{
				a[i][0]=str.charAt(k);
				k++;
			}  
			for(int i=0;i<row;i++) 
			{
				a[i][2]=str.charAt(k);
				k++;
			}  
			for(int i=0;i<row;i++) 
			{
				a[i][5]=str.charAt(k);
				k++;
			}  
			for(int i=0;i<row;i++) 
			{
				a[i][1]=str.charAt(k);
				k++;
			}  
			System.out.println("decrypted:");
			for(int i=0;i<row;i++)
			{
				for(int j=0;j<6;j++)
				{
					System.out.print(a[i][j]);
				}
			}
			ss.close();  
		}
		catch(Exception e)
		{
			System.out.println(e);  
		}  
	}
}
```
