<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>添加</title>
</head>
<body>
<!--
    我们指定form默认自动绑定的是Model的command属性值，
那么当我的form对象对应的属性名称不是command的时候该如何处理？
    指定modelAttribute属性也可以达到相同的效果，此时传进来的就是
我们指定的对象名。
    modelAttribute和command必须二选一，而且必须有一个存在。
-->
<form:form action="${ctx}/emp" modelAttribute="employee">
    <!-- path:就是input标签的name -->
    姓名：<form:input path="lastName"></form:input><br/>
    邮箱：<form:input path="email"></form:input><br/>
    性别：
    男：<form:radiobutton path="gender" value="1"></form:radiobutton>
    女：<form:radiobutton path="gender" value="0"></form:radiobutton><br/>
    <!--
		items=""：指定要遍历的集合 ；自动遍历；遍历出的每一个元素是一个department对象
		itemLabel="属性名"：指定遍历出的这个对象的哪个属性是作为option标签体的值
		itemValue="属性名"：指定刚才遍历出来的这个对象的哪个属性是作为要提交 的value值
		 -->
    所在部门：
    <form:select path="department.id" items="${depts}" itemLabel="departmentName" itemValue="id"></form:select><br/>
    <input type="submit" value="提交"/><br/>
</form:form>
<hr/>











<%--    <form action="">--%>
<%--    姓名：<input type="text" name="lastName"/><br/>--%>
<%--    邮箱：<input type="text" name="email"/><br/>--%>
<%--    性别：--%>
<%--    男：<input type="radio" name="gender" value="1"/>--%>
<%--    女：<input type="radio" name="gender" value="0"><br/>--%>
<%--    所在部门:--%>
<%--    <select name="department.id">--%>
<%--    <c:forEach items="${depts}" var="dept">--%>
<%--        <!-- 标签体中的是在页面的提示选项信息，value才是真正提交的值 -->--%>
<%--        <option value="${dept.id}">${dept.departmentName}</option>--%>
<%--    </c:forEach>--%>
<%--    </select><br/>--%>
<%--    <input type="submit" value="提交"/>--%>
<%--    </form>--%>
</body>
</html>
