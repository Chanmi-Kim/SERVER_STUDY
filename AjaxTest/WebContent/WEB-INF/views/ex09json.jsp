<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach items="${list}" var="dto" varStatus="status">
	 {
		"seq": "${dto.seq}",
		"type": "${dto.type}",
		"data": "${dto.data}",
		"regdate": "${dto.regdate}"
	}
	<c:if test="${status.index != list.size()-1}">
	,
	</c:if>
	</c:forEach>
]