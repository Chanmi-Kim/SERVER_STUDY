<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	//1.
	String path = application.getRealPath("/files");
	
	//2.
	int size = 1024 * 1024 * 100;
	
	//3.
	String subject = "";
	String name = "";
	ArrayList<String> filename = new ArrayList<String>();
	ArrayList<String> orgfilename = new ArrayList<String>();
	
	try {
		
		//단일 파일 or 다중 파일
		MultipartRequest multi = new MultipartRequest(
													request,
													path,
													size,
													"UTF-8",
													new DefaultFileRenamePolicy()
												);
		//P:\class\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
		
		//다중 파일명 알아내기
		Enumeration e = multi.getFileNames();
		
		while (e.hasMoreElements()) {
			//System.out.println(e.nextElement());
			String file = (String)e.nextElement();
			
			filename.add(multi.getFilesystemName(file));
			orgfilename.add(multi.getOriginalFileName(file));
		}
		
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
	<!-- ex32_file_ok.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<% for (int i=0; i<filename.size(); i++) { %>
		
		<div>
			<a href="/JSPTest/files/<%= filename.get(i) %>" download>
				<%= orgfilename.get(i) %>
			</a>
		</div>
		
		<% } %>
		
	</div>
</body>
</html>











