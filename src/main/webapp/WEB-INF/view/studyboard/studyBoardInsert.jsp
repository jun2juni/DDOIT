<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학습자료 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: rgb(240, 134, 0);
            --main-rgb: 240, 134, 0;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .container {
            margin-top: 60px;
            margin-bottom: 60px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 15px 15px 0 0 !important;
            padding: 1.5rem;
        }

        .card-title {
            color: var(--main-color);
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 0;
        }

        .form-label {
            color: #495057;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 0.5rem 1rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--main-color);
            box-shadow: 0 0 0 0.2rem rgba(var(--main-rgb), 0.25);
        }

        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            color: #495057;
        }

        .btn-main {
            background-color: var(--main-color);
            color: white;
            padding: 8px 24px;
            border-radius: 5px;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-main:hover {
            background-color: rgba(var(--main-rgb), 0.8);
            color: white;
        }

        .btn-outline {
            color: #6c757d;
            border: 1px solid #6c757d;
            padding: 8px 24px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn-outline:hover {
            background-color: #6c757d;
            color: white;
        }

        .note-editor {
            border-radius: 8px;
            overflow: hidden;
        }

        .note-editor.note-frame {
            border: 1px solid #ced4da;
        }

        .note-editor.note-frame .note-statusbar {
            background-color: #f8f9fa;
        }

        .file-upload-wrapper {
            position: relative;
            border: 2px dashed #ced4da;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .file-upload-wrapper:hover {
            border-color: var(--main-color);
        }

        .file-upload-icon {
            font-size: 2rem;
            color: #6c757d;
            margin-bottom: 10px;
        }

        .file-list {
            margin-top: 15px;
        }

        .file-item {
            display: flex;
            align-items: center;
            padding: 8px 12px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 8px;
        }

        .file-item i {
            margin-right: 8px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="container">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fas fa-plus-circle"></i>
                학습자료 등록
            </h3>
        </div>
        <div class="card-body">
            <form action="studyBoardInsert.do" method="post" enctype="multipart/form-data">
                <div class="mb-4">
                    <label for="boardName" class="form-label">제목</label>
                    <input type="text" class="form-control" id="boardName" name="boardName" 
                           placeholder="제목을 입력하세요" required>
                </div>

                <div class="mb-4">
                    <label for="boardType" class="form-label">게시판 유형</label>
                    <select class="form-select" id="boardType" name="boardType" required>
                        <option value="">유형을 선택하세요</option>
                        <option value="studyBoard">학습자료공유실</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="boardContent" class="form-label">내용</label>
                    <textarea class="form-control" id="boardContent" name="boardContent" rows="10" required></textarea>
                </div>

                <div class="mb-4">
                    <label class="form-label">첨부파일</label>
                    <div class="file-upload-wrapper">
                        <div class="file-upload-icon">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                        <p class="mb-2">파일을 드래그하거나 클릭하여 업로드하세요</p>
                        <input type="file" class="form-control" id="files" name="files" multiple>
                        <div id="fileList" class="file-list"></div>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="boardStatus" class="form-label">상태</label>
                    <select class="form-select" id="boardStatus" name="boardStatus" required>
                        <option value="Y">활성</option>
                        <option value="N">비활성</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="adminMemberNo" class="form-label">관리자 회원 번호</label>
                    <input type="number" class="form-control" id="adminMemberNo" name="adminMemberNo" placeholder="관리자 회원 번호를 입력하세요" required>
                </div>

                <div class="text-center">
                    <a href="studyBoardList.do" class="btn btn-outline me-2">취소</a>
                    <button type="submit" class="btn btn-main">등록하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
    $(document).ready(function() {
        // Summernote 에디터 초기화
       	$('#boardContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: 'ko-KR',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        }); 

        // 파일 업로드 미리보기
        $('#files').on('change', function() {
            $('#fileList').empty();
            const files = Array.from(this.files);
            
            files.forEach(file => {
                const fileItem = $('<div class="file-item">')
                    .append($('<i class="fas fa-file">'))
                    .append($('<span>').text(file.name));
                $('#fileList').append(fileItem);
            });
        });

        // 드래그 앤 드롭 기능
        const dropZone = $('.file-upload-wrapper');
        
        dropZone.on('dragover', function(e) {
            e.preventDefault();
            $(this).css('border-color', var('--main-color'));
        });

        dropZone.on('dragleave', function(e) {
            e.preventDefault();
            $(this).css('border-color', '#ced4da');
        });

        dropZone.on('drop', function(e) {
            e.preventDefault();
            $(this).css('border-color', '#ced4da');
            const files = e.originalEvent.dataTransfer.files;
            $('#files')[0].files = files;
            $('#files').trigger('change');
        });
    });
</script>
</body>
</html>