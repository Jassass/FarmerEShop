<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${param.addItemButton}">
    <sql:update>
        Create Table if not exists cart${contactNumber}(ID int NOT NULL AUTO_INCREMENT, itemId int , quantity int not null, PRIMARY KEY (ID), FOREIGN KEY (itemId) REFERENCES items(id))
    </sql:update>
    <sql:update>
        Insert into cart${contactNumber}(itemId, quantity) values(?, ?)
        <sql:param value="${param.cartItem}" />
        <sql:param value="${param.quantity}" />
    </sql:update>
    <jsp:forward page="cart.jsp"></jsp:forward>
</c:if>