<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

	<sql:update>
		delete from notifications where itemid=${param.id}
	</sql:update>
	<sql:update>
		update items set available=0 where id=${param.id}
	</sql:update>

	<jsp:forward page="items.jsp"></jsp:forward>