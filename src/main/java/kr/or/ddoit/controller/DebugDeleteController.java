package kr.or.ddoit.controller;

import java.io.IOException;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddoit.service.IPostService;
import kr.or.ddoit.service.PostService;
import kr.or.ddoit.vo.ReplyVo;

@WebServlet("/debugDelete.do")
public class DebugDeleteController extends HttpServlet{
	IPostService postService = PostService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("debugDelete.do post요청");
		ReplyVo replyVo=new ReplyVo();
		
		String data = StreamData.dataChange(req);
		JSONObject jsonObject = new JSONObject(data);
		String type = jsonObject.getString("type");
		int result = 0;
		int number = jsonObject.getInt("number");
		if(type.equals("post")) {
			replyVo.setPostNo(number);
			result += postService.postDelete(replyVo);
			result += postService.superDeleteReply(replyVo);
			result += postService.superDeleteComments(replyVo);
		}else if(type.equals("reply")) {
			replyVo.setReplyNo(number);
			result += postService.superDeleteReply(replyVo);
			result += postService.superDeleteComments(replyVo);
		}
	}
}









