<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 이미지 파일 업로드 처리
	//2. 이미지 파일 썸네일 생성
	
	String path = application.getRealPath("/files");
	int size = 1024 * 1024 * 100;
	String filename = "";
	
	try {
		
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		filename = multi.getFilesystemName("img");
		
		
		//이미지 리사이즈 + 생성
		
		//GD API
		ParameterBlock pb = new ParameterBlock();
		pb.add(path + "/" + filename);
		RenderedOp rOp = JAI.create("fileload", pb);
		
		BufferedImage bi = rOp.getAsBufferedImage();//업로드된 이미지 파일 참조 객체(원본)
		System.out.println(bi.getWidth());
		System.out.println(bi.getHeight());
		
		//1024 : 500 = X : 100
		int thumbHeight = 100;
		int thumbWidth = bi.getWidth() * thumbHeight / bi.getHeight();
		
		BufferedImage thumb = new BufferedImage(thumbWidth, thumbHeight
													, BufferedImage.TYPE_INT_RGB);
		
		//GD 객체
		Graphics2D g = thumb.createGraphics();
		g.drawImage(
					bi, 
					0, 0, 
					thumbWidth, thumbHeight, 
					0, 0, 
					bi.getWidth(), bi.getHeight(), 
					null);
		
		File file = new File(path + "/sm_" + filename); //sm_wall01.jpg
		ImageIO.write(thumb, "png", file);
		
	} catch (Exception e) {
		System.out.println(e);
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
	<!-- ex33_thumbnail_ok.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<h2>원본</h2>
		<img src="/JSPTest/files/<%= filename %>">
		
		<h2>썸네일</h2>
		<img src="/JSPTest/files/sm_<%= filename %>">
		
	</div>
</body>
</html>











