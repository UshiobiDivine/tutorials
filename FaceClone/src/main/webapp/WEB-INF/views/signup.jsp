<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>

<body>

<div class="header">Sign Up</div>
<div class="con">
    <form action="userSignedup" method="post">

        <%--@declare id="gender"--%>
        <input type="text" name="firstname" id="first_name">
        <input type="text" name="lastname" id="lastname"><br>
        <input type="text" name="email_num" id="email_num"><br>
        <input type="password" name="password" id="password"><br>

        <label for="birthdate">Date of birth</label><br>
        <input type="date" name="birthdate" id="birthdate"><br>

        <label for="gender">Gender</label><br>
        <input type="radio" id="male" name="gender" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="other">
        <label for="other">Other</label>


        <div class="text">By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy. You may
            receive SMS notifications from us and can opt out at any time.</div>

        <button type="submit" value="">Sign Up</button>
    </form>
</div>

<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="signup">Hello Servlet</a>--%>
</body>
</html>