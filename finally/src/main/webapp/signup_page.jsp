<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        #firstname, #lastname, #email_num, #password, #birthdate{
            width:50%;
            padding: 7px;
            margin: 10px;
            border: 2px solid rgb(28, 119, 255);
            border-radius: 6px;

        }

        button{
            width:50%;
            padding: 12px;
            border: 0;
            background-color:rgb(0, 168, 70);
            font-size:20px;
            color:white;
            border-radius: 6px;
        }
        .con, .header{
            text-align:center;
            padding-top: 50px;
        }
        .header{
            font-size: 50px;
            color:rgb(45, 101, 255);
            font-weight:bold;
            margin-bottom: 17px;
        }
        #male, #female, #other{

        }
        .text{
            margin-top: 40px;
        }
    </style>
</head>

<body>

<div class="con" >
    <div class="header">Sign Up</div>
    <form action="signedup" method="post">

        <input type="text" name="firstname" id="firstname" placeholder="First Name"><br>

        <input type="text" name="lastname" id="lastname" placeholder="Last Name"><br>

        <input type="text" name="email_num" id="email_num" placeholder="Email"><br>

        <input type="password" name="password" id="password" placeholder="Password"><br>


        <input type="date" name="birthdate" id="birthdate" placeholder="Date of birth"><br>

        <label for="gender" id="gen"><b>Gender: </b></label>

        <input type="radio" id="male" name="gender" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="other">
        <label for="other">Other</label>


        <div class="text">By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy. You may
            receive SMS notifications from us and can opt out at any time.</div>

        <button type="submit" style="margin-top: 20px;">Sign Up</button>
    </form>
</div>
</body>

</html>