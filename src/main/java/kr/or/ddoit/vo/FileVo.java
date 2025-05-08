package kr.or.ddoit.vo;

import lombok.Data;

@Data
public class FileVo {
    private int fileNo;               // 파일 번호
    private int boardNo;              // 게시글 번호
    private String originalFileName;  // 원본 파일 이름
    private String storedFileName;    // 저장된 파일 이름
    private long fileSize;            // 파일 크기
}
