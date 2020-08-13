<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工信息表</title>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="5">
    <tr>
        <th>员工ID</th>
        <th>姓名</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>部门ID</th>
        <th>部门名</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
    <c:forEach items="${emps}" var="emp">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.lastName}</td>
            <td>${emp.email}</td>
            <td>${emp.gender==1?"男":"女"}</td>
            <td>${emp.department.id}</td>
            <td>${emp.department.departmentName}</td>
            <td>
                <form action="${ctx}/emp/${emp.id}" method="GET">
                    <input type="submit" value="编辑">
                </form>
            </td>
            <td>
                <form action="${ctx}/emp/${emp.id}" method="POST">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <input type="submit" value="删除">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="${ctx}/toAddPage"><input type="button" value="添加员工"></a>
</body>
</html>
