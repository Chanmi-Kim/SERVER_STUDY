<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:forEach items="${list}" var="dto">${dto.seq},${dto.type},${dto.data},${dto.regdate}
</c:forEach>