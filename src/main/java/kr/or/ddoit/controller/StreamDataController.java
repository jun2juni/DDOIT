package kr.or.ddoit.controller;

import java.io.BufferedReader;

import jakarta.servlet.http.HttpServletRequest;

public class StreamDataController {
	//buffered 를 사용하는 메소드를 만들어놓음 
		public static String dataChange(HttpServletRequest request) {
			// 1.전송데이터 받기
					StringBuffer strbuf = new StringBuffer();
					String line = null;
					
					
					try {
						BufferedReader reader =  request.getReader();
						
						while(true){
							//한줄읽어서
							line = reader.readLine();
							if(line==null)break;
							//버퍼에 입력시키는것
							strbuf.append(line);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
				
					}
					
					String reqdata= strbuf.toString();
					System.out.println(reqdata);
					
					
					return reqdata;
					
					
					
		}
}
