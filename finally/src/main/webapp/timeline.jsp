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

%>

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
            font-family: 'Arial Unicode MS';
        }



        a {
            color: #ffffff;
            font-weight: 500;
            -webkit-transition: -webkit-transform 0.2s;
            transition: transform 0.2s;
            display: inline-block;
            text-decoration: none;
            position: relative;
        }
        a::before {
            position: absolute;
            top: 0;
            left: -10px;
            z-index: -1;
            box-sizing: content-box;
            padding: 0 10px;
            width: 100%;
            height: 100%;
            border-radius: 5px;
            background-color: #fff;
            content: '';
            opacity: 0;
            -webkit-transition: -webkit-transform 0.4s, opacity 0.3s;
            transition: transform 0.4s, opacity 0.3s;
            -webkit-transform: scale(0);
            transform: scale(0);
        }
        a:hover::before
        {
            opacity: 1;
            -webkit-transform: scale(1);
            transform: scale(1);
        }








        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button, .item3333 {
            background-color: #e73d3d;
            color: white;
            /*padding: 16px 20px;*/
            border: none;
            cursor: pointer;
            opacity: 0.8;
            /*position: fixed;*/
            /*bottom: 23px;*/
            /*right: 28px;*/
            /*width: 280px;*/
        }

        /* The popup form - hidden by default */
        .form-popup {
            display: none;
            position: fixed;
            bottom: 0;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 300px;
            padding: 10px;
            background-color: white;
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
            margin-bottom: 10px;
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




        .rightgrid, .leftgrid {
            display: grid;
            grid-gap: 10px;
            grid-template-rows: repeat(1fr, auto);
            background-color: rgb(255, 255, 255);
            padding: 5px;

        }

        .subcontain {
            width: 100%;
            height: 700px;
            color: #181818;
            overflow: auto;
            padding: 4px;
        }

        .subcontain2 {

            width: 100%;
            height: 700px;
            color: #820ab9;
            overflow: auto;
        }

        .item {
            padding: 10px;
            background-color: #ffffff;
            /*-webkit-box-shadow: -2px 0px 3px 1px rgba(0, 0, 0, 0.34);*/
            /*box-shadow: -2px 0px 3px 1px rgba(119, 119, 119, 0.34);*/
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

        .post-head, .comments {
            display: grid;
            grid-template-columns: 0.3fr 2fr 0.3fr;
        }

        .comment-text-input {
            display: grid;
            grid-template-columns: 0.3fr 2fr;
            margin-top: 10px;
        }

        .post-like-comment {
            display: grid;
            grid-template-columns: 1fr 1fr;
            height: 40px;
            align-items: center;
        }

        .comment {
            justify-items: right;
            padding-right: 10px;
            text-align: center;
        }

        .comment-num {
            padding-top: 5px;
        }

        .like, .like-num {
            text-align: center;
            padding-left: 10px;
            /* background-color:rgb(78, 32, 121); */
            justify-items: center;
        }

        .post-reaction-numbers {
            display: grid;
            grid-template-columns: 0.2fr 1fr 0.2fr 1fr;
            height: 20px;
        }

        .num-of-likes {
            margin-left: 60px;
        }

        .num-of-comments {
            margin-left: 5px;
        }

        .like-num {
            margin-left: -150px;
        }

        .make-post {
            background-color: #ffffff;
            padding: 15px;
        }
        button:hover{
            cursor: pointer;
            color: #ef5c5c;
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

        .post-head {
            padding-bottom: 10px;
            border-bottom: 1px solid rgb(253, 253, 253);
            background-color: rgb(255, 255, 255);
        }

        .post-body {
            margin-top: 6px;
            padding: 10px;
        }


        header {
            height: 60px;
            background-color: rgb(27, 150, 221);
            margin-bottom: 10px;
            padding-top: 15px;
            padding-left: 10px;

        }

        header{
            display: grid;
            grid-template-columns: 1fr 3fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ;
            grid-column-gap: 5px;
        }

    </style>
</head>


<body>

<header>
    <div class="head1"><IMG src="images/facebook.png" width="40px" height="40px"></div>
    <div class="head2"><IMG src="images/search-engine.png" width="90px" height="40px"></div>
    <div class="head3"><IMG src="images/iconfinder_calender_2944882.png" width="40px" height="40px"></div>
    <div class="head4"><IMG src="images/video.png" width="40px" height="40px"></div>
    <div class="head5"><IMG src="images/shopping-bag.png" width="40px" height="40px"></div>
    <div class="head6"><IMG src="images/iconfinder_user-alt_285645.png" width="40px" height="40px"></div>
    <div class="head7"><IMG src="images/multiple-users-silhouette.png" width="40px" height="40px"></div>
    <div class="head8"><IMG src="images/symbol-tool.png" width="40px" height="40px"></div>
    <div class="head9"><IMG src="images/grandson.png" width="40px" height="40px"></div>
    <div class="head10"><a href="logout"><IMG src="images/logout.png" width="40px" height="40px">Logout</a></div>

</header>

<div class="container">
    <div class="subcontain">
        <div class="leftgrid">

            <div class="item one" style="border-radius: 6px"><IMG src="images/grandson.png" width="90px" height="90px"> Profile</div>
            <div class="item two" style=" border-bottom: 2px solid #e8e8e8">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three" style=" border-bottom: 2px solid #e8e8e8">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four" style=" border-bottom: 2px solid #e8e8e8">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five" style=" border-bottom: 2px solid #e8e8e8">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six" style=" border-bottom: 2px solid #e8e8e8"> SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven" style=" border-bottom: 2px solid #e8e8e8">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight" style=" border-bottom: 2px solid #e8e8e8">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine" style=" border-bottom: 2px solid #e8e8e8">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten" style=" border-bottom: 2px solid #e8e8e8">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,
                quos!
            </div>

            <div class="item one" style=" border-bottom: 2px solid #e8e8e8">ONE</div>
            <div class="item two" style=" border-bottom: 2px solid #e8e8e8">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three" style=" border-bottom: 2px solid #e8e8e8">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four" style=" border-bottom: 2px solid #e8e8e8">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five" style=" border-bottom: 2px solid #e8e8e8">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six" style=" border-bottom: 2px solid #e8e8e8">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven" style=" border-bottom: 2px solid #e8e8e8">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight" style=" border-bottom: 2px solid #e8e8e8">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine" style=" border-bottom: 2px solid #e8e8e8">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten" style=" border-bottom: 2px solid #e8e8e8">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,
                quos!
            </div>

        </div>
    </div>

    <div class="subcontain2">


        <div class="make-post">
            <form action="timeline" method="post" name="textform">
                    <textarea id="firsttextarea"
                              style="resize: vertical; overflow: auto; height: auto; display:block; border-radius: 7px; border: 2px solid lightskyblue"
                              name="post_text"
                              id="" cols="70" rows="3"></textarea>
                <button type="submit"
                        style="background-color: dodgerblue !important; color: white; width: 120px; padding:15px; margin-left: 15px">
                    Post
                </button>

                <%--                <button type="submit" onclick="" style="display:block;">Post</button>--%>
            </form>


        </div>
        <c:forEach var="post" items="${posts}">
            <div class="incenter">

                <div class="itemcenter" style="background-color:rgb(255, 255, 255); display:block;">

                    <div class="post-head">
                        <div class="item1">
                            <div class=" profilepic"
                                 style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(255,255,255); border-radius: 50%;">
                                <IMG src="images/account.png" style="width: 45px; height: 45px">

                            </div>
                        </div>
                        <div class="item2 " style=" padding-left:3px">
                            <div class="username">Username</div>
                            <div class="date">date of post</div>
                        </div>


                    </div>

                    <div style="width:30px; margin-left: 445px">
                        <span class="item33"
                              style="background-color: #ef5c5c;  border-radius: 4px; padding: 4px;"><a
                                href="delete?postID=${post.key.postID}" style="text-decoration: none; link: white;text-align: center;  width: 100px">delete</a></span>


                        <form action="edit" method="post">
                            <input type="hidden" value="${post.key.postID}" name="post_id">
                            <input type="hidden" value="${post.key.body}" name="postbody">
                            <button type="submit" style="background-color: dodgerblue !important; color: #ffffff; margin-left: 3px; width: 100px; ">edit</button>
                        </form>

                            <%--<button class="open-button" onclick="openForm()">edit</button>--%>

                    </div>

<%--                    <div>${ post.key.date}</div>--%>
                    <div class="post-body" style="margin-bottom: 25px; font-weight: bold; text-align: center; background-color: #c4e0f6; color: #000000">
                        <c:out value="${post.key.body}"/>
                    </div>

                    <div style="background-color:rgb(235, 235, 235);  border-top:0 solid gray"
                         class="post-reaction-numbers">
                        <div class="num-of-likes" style="padding-left:30px; ">${post.key.numofLikes}</div>
                        <div class="like-num" style="padding-right:150px">likes</div>
                    </div>

                    <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid #ffffff;"
                         class="post-like-comment">

                        <a href="like?postID=${post.key.postID}">
                            <div class="like"
                                 style="background-color: rgb(255,255,255); padding-top: 10px; border: 2px solid #bbbbbb; padding-bottom:10px">
                                <div><IMG src="images/fblike.png" style="width: 30px; height: 30px"></div>
                            </div>
                        </a>

                        <div class="comment"
                             style="background-color: rgb(241, 241, 241);  padding-top: 10px; padding-bottom:10px">
                            <div><IMG src="images/comment%20(1).png" style="width: 30px; height: 30px"></div>
                        </div>

                    </div>

                    <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid gray;" class="comments">
                        <div class="item1">
                            <div class=" profilepic"
                                 style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(94, 94, 94); border-radius: 50%;">
                            </div>
                        </div>


                    </div>
                    <div class="comment-num" style="margin-top: 15px">All comments</div>
                    <div>

                        <c:forEach var="comment" items="${post.value}">

                            <div id="comment" class="card" style="border: 2px solid rgba(177,177,177,0.54); border-radius: 5px; padding: 5px; margin-top: 5px">
                                <div>
                                    <h6 style="padding-bottom: -20px">${comment.date}</h6>
                                </div>
                                <div style="padding-bottom: 5px">
                                        ${comment.comment}
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div style="background-color:rgb(255, 255, 255);" class="comment-text-input">


                        <div class="item2">
                            <form action="comment?postID=${post.key.postID}" method="post">
                    <textarea id="secondtextarea" style="resize: vertical; overflow: auto; height: auto;
                    display:block;" name="comment" cols="55" rows="2" placeholder="write a comment"></textarea>
                                <button type="submit" style="background-color: dodgerblue; border: 2px solid #444444; color: white">comment</button>
                            </form>
                        </div>


                    </div>

                </div>


            </div>

        </c:forEach>


        <div class="form-popup" id="myForm">
            <form action="edit" class="form-container">


                <%--                <div ><a href="edit?postID=${post.key.postID}">edit</a></div>--%>
                <%--            <input name="postID" value="${post.key.postID}" style="display: none">--%>
                <textarea name="edittextarea" style="resize: vertical; overflow: auto; height: auto; display:block;"
                          id="edittextarea" cols="30" rows="10"></textarea>
                <input type="hidden" name="postID" value="${post.key.postID}">

                <%--                <label for="email"><b>Email</b></label>--%>
                <%--                <input type="text" placeholder="Enter Email" name="email" required>--%>

                <%--                <label for="psw"><b>Password</b></label>--%>
                <%--                <input type="password" placeholder="Enter Password" name="psw" required>--%>

                <button type="submit" class="btn">Edit</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
            </form>
        </div>


    </div>

    <div class="subcontain">
        <div class="rightgrid">

            <div class="item one" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/groups.png" width="40px" height="40px">  <span style="font-family: 'Arial Unicode MS'; padding-right: 25px">Friends</span> </div>
            <div class="item two" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/comment.png" width="40px" height="40px"> <span style="font-family: 'Arial Unicode MS';">Comment</span></div>
            <div class="item three" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/connection.png" width="40px" height="40px"> <span style="font-family: 'Arial Unicode MS'">Connection</span></div>
            <div class="item four" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/messenger.png" width="40px" height="40px"> <span style="font-family: 'Arial Unicode MS'">Messenger</span></div>
            <div class="item five" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/social-media.png" width="40px" height="40px"><span style="font-family: 'Arial Unicode MS'">Social</span></div>
            <div class="item six" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/like.png" width="40px" height="40px"><span style="font-family: 'Arial Unicode MS'">Love</span></div>
            <div class="item seven" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/messenger%20(2).png" width="40px" height="40px"><span style="font-family: 'Arial Unicode MS'">Messenger</span></div>
            <div class="item eight" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/social-growth.png" width="40px" height="40px"><span style="font-family: 'Arial Unicode MS'">Growth</span></div>
            <div class="item nine" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/groups.png" width="40px" height="40px"></div>
            <div class="item ten" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/facebook.png" width="40px" height="40px">
            </div><IMG src="images/groups.png" width="40px" height="40px"> Friends</div>
        <div class="item one" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/groups.png" width="40px" height="40px"> Friends</div>
        <div class="item two" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/comment.png" width="40px" height="40px"></div>
        <div class="item three" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/connection.png" width="40px" height="40px"></div>
        <div class="item four" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/messenger.png" width="40px" height="40px"></div>
        <div class="item five" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/social-media.png" width="40px" height="40px"></div>
        <div class="item six" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/like.png" width="40px" height="40px"></div>
        <div class="item seven" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/messenger%20(2).png" width="40px" height="40px"></div>
        <div class="item eight" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/social-growth.png" width="40px" height="40px"></div>
        <div class="item nine" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/groups.png" width="40px" height="40px"></div>
        <div class="item ten" style=" border-bottom: 2px solid #e8e8e8"><IMG src="images/facebook.png" width="40px" height="40px">
        </div><IMG src="images/groups.png" width="40px" height="40px"> Friends</div>


    </div>
</div>
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
        document.getElementById("edittextarea").value = "Nobody there na";
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
</body>


</html>
