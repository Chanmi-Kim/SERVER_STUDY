<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//준비
	//1. 업로드 파일을 어디에 저장할지 설정
	// - 웹경로 표기(X) -> 로컬 파일 경로 표기(O)
	// - /files, http://localhost/jsp/files : X
	// - D:\class\js\files : O
	//String path = "P:\class\server\JSPTest\WebContent\files";
	
	//String path = request.getRealPath("/files");
	String path = application.getRealPath("/files");
	
	//P:\class\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	//System.out.println(path);
	
	//2. 업로드 파일의 최대 크기(최대한 작게..)
	// - 게시판 : 2MB
	// - 바이트 단위
	int size = 1024 * 1024 * 100;//100MB
	
	//3. 변수 선언
	String subject = "";
	String name = "";
	String filename = ""; //첨부파일명
	String orgfilename = ""; //첨부파일명
	
	//<form enctype="multipart/form-data"> 적용하면..
	// - request.getParameter() 동작을 안한다.
	// - request를 대신할 다른 객체를 사용한다. > cos.jar > MultipartRequest 사용
	
	//subject = request.getParameter("subject");
	//System.out.println(subject);
	
	request.setCharacterEncoding("UTF-8");
	
	try {
		
		//com.oreilly.servlet.MultipartRequest
		//객체를 생성하는 순간 업로드한 파일은 이미 서버에 저장이 완료된다.
		MultipartRequest multi = new MultipartRequest(
													request, //request 객체의 Wrapping 객체
													path, //업로드 폴더 지정
													size, //업로드 파일 크기
													"UTF-8", //인코딩 방식
													new DefaultFileRenamePolicy()
												);
		
		//데이터 수신하기
		subject = multi.getParameter("subject");
		name = multi.getParameter("name");
		
		//파일 정보 수신하기
		filename = multi.getFilesystemName("attach");//<input type="file" name="attach"
		orgfilename = multi.getOriginalFileName("attach");
		
		
		
		
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex31_file_ok.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<div>제목 : <%= subject %></div>
		<div>이름 : <%= name %></div>
		
		<hr>
		
		<div>파일명(물리) : <%= filename %></div>
		<div>파일명(원본) : <%= orgfilename %></div> 
		
		<hr>
		
		<h2>파일 다운로드</h2>
		
		<div><a href="/JSPTest/files/<%= filename %>"><%= orgfilename %></a></div>
	
	
		<div><a href="ex31_file_down.jsp?file=<%= filename %>"><%= orgfilename %></a></div>
		
		<div><a href="/JSPTest/files/<%= filename %>" download><%= orgfilename %></a></div>
		
	</div>
</body>
</html>











