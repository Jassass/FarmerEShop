<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <c:if test="${param.addItemButton}">
            <sql:update>
                Insert into cart(user, itemId, quantity) values(?, ?, ?)
                <sql:param value="${contactNumber}" />
                <sql:param value="${param.cartItem}" />
                <sql:param value="${param.quantity}" />
            </sql:update>
            <jsp:forward page="cart.jsp"></jsp:forward>
        </c:if>