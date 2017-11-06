<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <sql:update>
        DELETE FROM cart WHERE Id=?
        <sql:param value="${param.id}" />
    </sql:update>

    <jsp:forward page="myCart.jsp"></jsp:forward>