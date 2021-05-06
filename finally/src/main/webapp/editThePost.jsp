<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dee.entity.Comment" %>
<%@ page import="com.dee.entity.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 07:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<Post, List<Comment>> posts = (Map<Post, List<Comment>>) request.getAttribute("userPosts");
    //pageContext.setAttribute("post", posts);
    String postToEdit1 = (String) request.getAttribute("oldPost");
    String thePostID = (String) request.getAttribute("thePostID");

%>
<c:set var="toEditpost2" value="<%=postToEdit1%>"></c:set>

<c:set var="posts" value="<%=posts%>"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <style>
        body {
            margin: 0;
        }


        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom:10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }



        .container {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr;
            grid-gap: 10px;

        }

        .subcontain1, .subcontain2, .subcontain3 {
            background-color: rgb(245, 245, 245);
            text-align: center;
        }

        header {
            height: 60px;
            background-color: rgb(27, 150, 221);
            margin-bottom: 10px;

        }


        .subcontain2 {

            width: 100%;
            height: 700px;
            color: #17a5e8;
            overflow: auto;
        }


        .incenter {
            padding: 10px;
            text-align: justify;

        }

        .itemcenter {
            color: #222222;
            background-color: rgb(255, 255, 255);
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
            -webkit-box-shadow: -2px 0px 3px 1px rgba(0, 0, 0, 0.34);
            box-shadow: -2px 0px 3px 1px rgba(119, 119, 119, 0.34);
        }


        .make-post {
            background-color: #13c0f3;
            padding: 15px;
            width: 100%;
        }

        textarea {
            border: 1px solid rgb(109, 109, 109);
            border-radius: 15px;
        }

        button {
            padding: 7px;
            border: 1px solid rgb(228, 228, 228);
            border-radius: 5px;
            margin-top: 10px;
            margin-right: 50px;
        }


    </style>
</head>


<body>
<header>

</header>

<%--<div class="container">--%>
<%--    <div class="subcontain">--%>
<%--        <div class="leftgrid">--%>

<%--            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,--%>
<%--                quos!--%>
<%--            </div>--%>

<%--            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,--%>
<%--                quos!--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>

    <div class="subcontain2">


        <div class="make-post">
<%--            <%Post postToEdit = (Post) request.getAttribute("thePostID");%>--%>
            <div id="postSection">
                <div class="form-group shadow-textarea">
                    <form action="viewPosts?postID=<%= thePostID%>" method="POST">
<%--                        <label for="exampleFormControlTextarea6">Edit Post</label>--%>
                        <textarea cols="70"  rows="3" name="postMessage">
                            <%= postToEdit1%>
                        </textarea>
                        <input type="hidden"  name="postID" value="<%= thePostID%>"><br>
                        <button type="submit">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--        </div>--%>
<%--        <c:forEach var="post" items="${posts}">--%>
<%--            <div class="incenter">--%>

<%--                <div class="itemcenter" style="background-color:rgb(255, 255, 255); display:block;">--%>

<%--                    <div class="post-head">--%>
<%--                        <div class="item1">--%>
<%--                            <div class=" profilepic"--%>
<%--                                 style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(184, 184, 184); border-radius: 50%;">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="item2 " style=" padding-left:3px">--%>
<%--                            <div class="username">Username</div>--%>
<%--                            <div class="date">date of post</div>--%>
<%--                        </div>--%>


<%--                    </div >--%>

<%--                    <div style="width:30px; margin-left: 445px">--%>
<%--                        <span class="item3333" style="color: #dddddd"><a href="delete?postID=${post.key.postID}">delete</a></span>--%>

<%--                        <button class="open-button" onclick="openForm()">edit</button>--%>

<%--                    </div>--%>

<%--                    <div>${ post.key.date}</div>--%>
<%--                    <div class="post-body">--%>
<%--                            <c:out value="${post.key.body}" />--%>
<%--                    </div>--%>

<%--                    <div style="background-color:rgb(235, 235, 235);  border-top:0 solid gray"--%>
<%--                         class="post-reaction-numbers">--%>
<%--                        <div class="num-of-likes" style="padding-left:30px; ">${post.key.numofLikes}</div>--%>
<%--                        <div class="like-num" style="padding-right:150px">likes</div>--%>
<%--                    </div>--%>

<%--                    <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid gray;"--%>
<%--                         class="post-like-comment">--%>
<%--                        <a href="like?postID=${post.key.postID}">--%>
<%--                            <div class="like"--%>
<%--                                 style="background-color: rgb(223, 223, 223); padding-top: 10px; padding-bottom:10px">--%>
<%--                                LIKE--%>
<%--                            </div>--%>
<%--                        </a>--%>

<%--                            <div class="comment"--%>
<%--                                 style="background-color: rgb(241, 241, 241);  padding-top: 10px; padding-bottom:10px">--%>
<%--                                COMMENT--%>
<%--                            </div>--%>

<%--                    </div>--%>

<%--                    <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid gray;" class="comments">--%>
<%--                        <div class="item1">--%>
<%--                            <div class=" profilepic"--%>
<%--                                 style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(94, 94, 94); border-radius: 50%;">--%>
<%--                            </div>--%>
<%--                        </div>--%>



<%--                    </div>--%>
<%--                    <div class="comment-num" >All comments</div>--%>
<%--                    <div>--%>

<%--                        <c:forEach var ="comment" items="${post.value}">--%>

<%--                            <div id="comment" class="card">--%>
<%--                                <div >--%>
<%--                                    <h6 style="padding-bottom: -20px">${comment.date}</h6>--%>
<%--                                </div>--%>
<%--                                <div style="padding-bottom: -20px">--%>
<%--                                    ${comment.comment}--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
<%--                    </div>--%>

<%--                    <div style="background-color:rgb(255, 255, 255);" class="comment-text-input">--%>


<%--                        <div class="item2">--%>
<%--                            <form action="comment?postID=${post.key.postID}" method="post">--%>
<%--                    <textarea id="secondtextarea" style="resize: vertical; overflow: auto; height: auto;--%>
<%--                    display:block;" name="comment" cols="55" rows="3" placeholder="write a comment"></textarea>--%>
<%--                                <button type="submit">comment</button>--%>
<%--                            </form>--%>
<%--                        </div>--%>


<%--                    </div>--%>

<%--                </div>--%>


<%--            </div>--%>

<%--        </c:forEach>--%>


<%--        <div class="form-popup" id="myForm">--%>
<%--            <form action="edit" class="form-container">--%>

<%--&lt;%&ndash;                <div ><a href="edit?postID=${post.key.postID}">edit</a></div>&ndash;%&gt;--%>
<%--            <input name="postID" value="${post.key.postID}" style="display: none">--%>
<%--                <textarea name="editedpost" style="resize: vertical; overflow: auto; height: auto; display:block;"--%>
<%--                          id="" cols="30" rows="10"></textarea>--%>

<%--&lt;%&ndash;                <label for="email"><b>Email</b></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="text" placeholder="Enter Email" name="email" required>&ndash;%&gt;--%>

<%--&lt;%&ndash;                <label for="psw"><b>Password</b></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="password" placeholder="Enter Password" name="psw" required>&ndash;%&gt;--%>

<%--                <button type="submit" class="btn">Edit</button>--%>
<%--                <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>--%>
<%--            </form>--%>
<%--        </div>--%>


<%--    </div>--%>

<%--    <div class="subcontain">--%>
<%--        <div class="rightgrid">--%>

<%--            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!--%>
<%--            </div>--%>

<%--            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>--%>
<%--            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>


<script>
    function myFunction() {
        var elmnt = document.getElementsByClassName("itemcenter")[0];
        var cln = elmnt.cloneNode(true);
        cln.style.display = "block";
        var c = document.getElementById("firsttextarea").value;

        cln.children[1].innerHTML = c;
        var elmnt2 = document.getElementsByClassName("incenter")[0];
        document.textform.firsttextarea.value = "";

        elmnt2.appendChild(cln);
    };



    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
</body>


</html>
