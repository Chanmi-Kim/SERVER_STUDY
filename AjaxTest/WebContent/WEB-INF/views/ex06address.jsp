<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:forEach items="${list}" var="dto">${dto.zipcode},${dto.sido},${dto.gugun},${dto.dong},${dto.bunji}
</c:forEach> --%><%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><?xml version="1.0" encoding="UTF-8"?>
<list>
<c:forEach items="${list}" var="dto">
	<item>
		<zipcode>${dto.zipcode}</zipcode>
		<address>${dto.sido} ${dto.gugun} ${dto.dong} ${dto.bunji}</address>
	</item>
</c:forEach>
</list>









