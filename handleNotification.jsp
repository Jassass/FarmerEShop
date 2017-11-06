<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
		<c:choose>
			<c:when test="${param.status == 1}">
				<sql:update>
					UPDATE items SET quantity=quantity-? WHERE id=?
					<sql:param value="${param.quantity}" />
					<sql:param value="${param.itemId}" />
				</sql:update>
				<sql:update>
					Insert into accepted values(?, 1)
					<sql:param value="${param.cartId}" />
				</sql:update>
				<c:set var="s" value="true" />
			</c:when>
			<c:when test="${param.status == 0}">
				<sql:update>
					Insert into accepted values(?, 0)
					<sql:param value="${param.cartId}" />
				</sql:update>
			</c:when>
		</c:choose>
		<sql:update>
			delete from notifications where cartId=?
			<sql:param value="${param.cartId}" />
		</sql:update>
		<jsp:forward page="notifications.jsp">
			<jsp:param name="status" value="${s}" />
		</jsp:forward>