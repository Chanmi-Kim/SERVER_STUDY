<%@ page language="java" contentType="text/xml; charset=UTF-8"    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach items="${list}" var="dto">
	<data>
		<seq>${dto.seq}</seq>
		<type>${dto.type}</type>
		<data>${dto.data}</data>
		<regdate>${dto.regdate}</regdate>
	</data>
	</c:forEach>
</list>