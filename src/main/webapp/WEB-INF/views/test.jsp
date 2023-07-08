<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Trang chủ</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color: #f7f7f7">
<table class="table">
  <thead>
  <tr>
    <th>Username</th>
    <th>Pass</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${products}" var="x">
    <tr>
      <td>${x.code}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<a href="/add" class="text-decoration-none text-light">
 <button class="btn btn-primary">Add</button>
</a>
<%--<table class="table mt-4">--%>
<%--  <thead>--%>
<%--  <tr>--%>
<%--    <th>Name</th>--%>
<%--    <th>State</th>--%>
<%--  </tr>--%>
<%--  </thead>--%>
<%--  <tbody>--%>
<%--  <c:forEach items="${roles}" var="x">--%>
<%--    <tr>--%>
<%--      <td>${x.name}</td>--%>
<%--      <td>${x.state}</td>--%>
<%--      <td>${x.getUsers().size()}</td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
<%--  </tbody>--%>
<%--</table>--%>
</body>
</html>
