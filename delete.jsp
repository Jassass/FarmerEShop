
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

	<sql:update>
	update items set available=0 where id=${param.id}  
	</sql:update> 

  <jsp:forward page="items.jsp"></jsp:forward>