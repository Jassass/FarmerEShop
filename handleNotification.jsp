<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${param.status == 1}">
	<sql:update>
	  UPDATE items
	  SET quantity=quantity-?
	  WHERE id=?
	  <sql:param value="${param.quantity}" />
	  <sql:param value="${param.itemId}" />  
	</sql:update>
	<c:set var="s" value="true" />
</c:if>
<sql:update>
    delete from cart where id=?
    <sql:param value="${param.cartId}" />
</sql:update>
<sql:update>
    delete from notifications where cartId=?
    <sql:param value="${param.cartId}" />
</sql:update>
<jsp:forward page="notifications.jsp">
	<jsp:param name="status" value="${s}" />
</jsp:forward>