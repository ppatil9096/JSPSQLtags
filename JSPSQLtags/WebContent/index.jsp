<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SQL DATASOURCE</title>
</head>
<body>
	<!-- Data Source -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/registration" user="root" password="root" />

	<!-- Update -->
	<sql:update var="count" dataSource="${db }">
	insert into Users(email,name,country,password) values ('pp@gmail.com','pravin','IND','admin');
	</sql:update>

	<!-- Query -->
	<sql:query var="rs" dataSource="${db }">
	select * from Users where id=?;
		<sql:param value="48"></sql:param>
	</sql:query>

	<table border="2" width="100%">
		<tr>
			<th>Email Id</th>
			<th>Name</th>
			<th>Country</th>
			<th>Password</th>
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
				<td>
					<c:out value="${table.name }" />
				</td>
				<td>
					<c:out value="${table.email }" />
				</td>
				<td>
					<c:out value="${table.country }" />
				</td>
				<td>
					<c:out value="${table.password }" />
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>