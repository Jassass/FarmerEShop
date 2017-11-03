<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update>
    INSERT INTO notifications(itemId, notificationTo, notificationFrom, date, cartId) VALUES(?, ?, ?, ?, ?)
    <sql:param value="${param.itemId}" />
    <sql:param value="${param.receiver}" />    
    <sql:param value="${param.sender}" />
    <sql:param value="<%= new java.util.Date() %>" />
    <sql:param value="${param.id}" />
</sql:update>
<sql:update>
    UPDATE cart${param.sender} SET status=1 where id=?
    <sql:param value="${param.id}" />
</sql:update>