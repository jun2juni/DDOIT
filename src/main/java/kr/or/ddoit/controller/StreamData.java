package kr.or.ddoit.controller;

import java.io.BufferedReader;

import jakarta.servlet.http.HttpServletRequest;

public class StreamData {
	
	public static String dataChange(HttpServletRequest request) {
		
		StringBuffer strbuf = new StringBuffer();
		String line = null;
		
		
		try {
			BufferedReader reader = request.getReader();
			
			while(true) {
				
				line = reader.readLine();
				if(line == null) break;
				
				strbuf.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String reqdata = strbuf.toString();
		System.out.println(reqdata);
		
		return reqdata;
	}

}
