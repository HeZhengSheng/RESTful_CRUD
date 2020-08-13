<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
</head>
<body>
<form:form action="${ctx}/emp/${employee.id}" modelAttribute="employee" method="post">
    <input type="hidden" name="_method" value="PUT"/>
    <input type="hidden" name="id" value="${employee.id }"/>
    邮箱：<form:input path="email"></form:input><br/>
    性别：
    男：<form:radiobutton path="gender" value="1"></form:radiobutton>
    女：<form:radiobutton path="gender" value="0"></form:radiobutton><br/>
    所在部门：
    <form:select path="department.id" items="${depts}" itemLabel="departmentName" itemValue="id"></form:select><br/>
    <input type="submit" value="提交"/><br/>
</form:form>
</body>
</html>
