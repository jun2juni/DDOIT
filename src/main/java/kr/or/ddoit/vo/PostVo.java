package kr.or.ddoit.vo;

import java.util.List;

import lombok.Data;

@Data
public class PostVo {
	
	// detail에서 사용할 요소들
	private int postNo;
	private int boardNo; // 게시판 번호(중분류?)
	private int memNo; // memId아님 주의
	private String postName;
	private String content; 
	private int viewCount; // 아맞다 detail 접속할때마다 +1해줘야 하는데...세션에서...? map으로 관리할까...? key는 postNo value는 view 접속할때마다 +1 해주고 로그아웃시 업데이트하기??
	private String createdDate; // 작성일자
	private String expiryDate; // 만료일자
	private String postStatus; // 사용가능여부
	private int recommendation; // 추천수 어휴 모르겠다
	
	
	// MEMBER 테이블 유저 닉네임
	private String memNickname;
	
	
	// 답글/댓글 관련
	private List<CommentsVo> comments;
	private List<ReplyVo> replyList;
	private ReplyVo accepted;
	
}
