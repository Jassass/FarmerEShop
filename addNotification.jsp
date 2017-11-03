<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update>
    INSERT INTO notifications(itemId, notificationTo, notificationFrom, date) VALUES(?, ?, ?, ?)
    <sql:param value="${param.id}" />
    <sql:param value="${param.receiver}" />    
    <sql:param value="${param.sender}" />
    <sql:param value="<%= new java.util.Date() %>" />
</sql:update>
<sql:update>
    Delete from cart${param.sender} where id=?
    <sql:param value="${param.id}" />
</sql:update>