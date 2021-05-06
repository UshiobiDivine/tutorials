<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 07:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin:0;
        }

        .container{
            display: grid;
            grid-template-columns: 1fr 2fr 1fr;
            grid-gap:10px;

        }
        .subcontain1, .subcontain2, .subcontain3{
            background-color:rgb(245, 245, 245);
            text-align:center;
        }
        header{
            height: 60px;
            background-color:rgb(27, 150, 221);
            margin-bottom: 10px;

        }


        .rightgrid, .leftgrid{
            display: grid;
            grid-gap:10px;
            grid-template-rows: repeat(1fr, auto);
            background-color:rgb(192, 151, 76);
            padding:5px;

        }

        .subcontain{
            width: 100%;
            height: 700px;
            color:#ff0000;
            overflow: auto;

        }

        .subcontain2{

            width: 100%;
            height: 700px;
            color:#820ab9;
            overflow: auto;
        }

        .item{
            background-color:blueviolet;
        }

        .incenter{
            padding: 10px;
            text-align: justify;

        }
        .itemcenter{
            color:#222222;
            background-color:rgb(255, 255, 255);
            padding:15px;
            border-radius:10px;
            margin:15px 0;
            -webkit-box-shadow: -2px 0px 3px 1px rgba(0,0,0,0.34);
            box-shadow: -2px 0px 3px 1px rgba(119, 119, 119, 0.34);
        }

        .post-head, .comments{
            display: grid;
            grid-template-columns: 0.3fr 2fr 0.3fr;
        }
        .comment-text-input{
            display: grid;
            grid-template-columns: 0.3fr 2fr;
            margin-top: 10px;
        }
        .post-like-comment{
            display: grid;
            grid-template-columns: 1fr 1fr;
            height: 40px;
            align-items: center;
        }
        .comment, .comment-num{
            justify-items: right;
            padding-right: 10px;
            text-align: center;
        }
        .like, .like-num{
            text-align: center;
            padding-left: 10px;
            /* background-color:rgb(78, 32, 121); */
            justify-items: center;
        }

        .post-reaction-numbers{
            display: grid;
            grid-template-columns: 0.2fr 1fr 0.2fr 1fr;
            height: 20px;
        }

        .num-of-likes{
            margin-left:60px;
        }
        .num-of-comments{
            margin-left:5px;
        }

        .like-num, .comment-num{
            margin-left:-150px;
        }
        .make-post{
            background-color:violet;
            padding: 15px;
        }

        textarea{
            border:1px solid rgb(109, 109, 109);
            border-radius: 15px;
        }

        button{
            padding: 7px;
            border:1px solid rgb(228, 228, 228);
            border-radius: 5px;
            margin-top:10px;
            margin-right: 50px;
        }
        .post-head{
            padding-bottom: 10px;
            border-bottom:1px solid rgb(253, 253, 253);
            background-color: rgb(255, 255, 255);
        }
        .post-body{
            margin-top:6px;
            padding: 10px;
        }

    </style>
</head>


<body>
<header>

</header>

<div class="container">
    <div class="subcontain">
        <div class="leftgrid">

            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,
                quos!</div>

            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa,
                quos!</div>

        </div>
    </div>

    <div class="subcontain2">

        <div class="make-post">
            <form action="timeline" method="post" name="textform">
                    <textarea id="firsttextarea" style="resize: vertical; overflow: auto; height: auto; display:block;" name="post_text"
                              id="" cols="50" rows="3"></textarea>
                <!-- <button type="submit">Post</button> -->

                <button type="submit" onclick="kk" style="display:block;">Post</button>
            </form>



        </div>

        <div class="incenter">

            <div class="itemcenter" style="background-color:rgb(255, 255, 255); display:none;">

                <div  class="post-head">
                    <div class="item1">
                        <div class=" profilepic"
                             style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(184, 184, 184); border-radius: 50%;">
                        </div>
                    </div>
                    <div class="item2 " style=" padding-left:3px">
                        <div class="username">Username</div>
                        <div class="date">date of post</div>
                    </div>
                    <div class="item3" style="width:30px"><a href="///">delete</a></div>

                </div>


                <div class="post-body">Lorem ipsum dolor sit amet consectetur
                    adipisicing elit. Quam quis blanditiis inventore saepe laboriosam maiores neque quod odit quaerat,
                    vel quos debitis ab, architecto ipsum impedit consequatur omnis pariatur similique optio mollitia
                    provident ducimus assumenda sunt. Quo sequi rem beatae culpa. Eius eum, aut provident voluptates
                    e.


                </div>

                <div style="background-color:rgb(235, 235, 235);  border-top:0 solid gray" class="post-reaction-numbers">
                    <div class="num-of-likes" style="padding-left:30px; ">0</div>
                    <div class="like-num" style="padding-right:150px">likes</div>
                    <div class="num-of-comments" style="padding-left:50px">0</div>
                    <div class="comment-num" style="padding-left:200px;">comments</div>
                </div>

                <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid gray;" class="post-like-comment">
                    <a href="///"><div class="like" style="background-color: rgb(223, 223, 223); padding-top: 10px; padding-bottom:10px">LIKE</div></a>
                    <a href="///"><div class="comment" style="background-color: rgb(241, 241, 241);  padding-top: 10px; padding-bottom:10px">COMMENT</div></a>
                </div>

                <div style="background-color:rgb(255, 255, 255); border-bottom:1px solid gray;" class="comments">
                    <div class="item1">
                        <div class=" profilepic"
                             style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(94, 94, 94); border-radius: 50%;">
                        </div>
                    </div>
                    <div class="item2 " style=" padding-left:3px; background-color:rgb(255, 255, 255)">
                        <div class="username">Username</div>
                        <div class="date">COMMENT</div>
                    </div>
                    <div class="item3" style="background-color:rgb(255, 255, 255) !important;">
                        <div style="padding-left: -9px; background-color:rgb(255, 255, 255)">
                            <a href="/////">delete</a>
                        </div>
                    </div>

                </div>

                <div style="background-color:rgb(255, 255, 255);" class="comment-text-input">

                    <div class="item2">
                        <form action="///" method="post">
                    <textarea id="secondtextarea" style="resize: vertical; overflow: auto; height: auto;
                    display:block;" name="comment" cols="55" rows="3" placeholder="write a comment"></textarea>
                            <button type="submit">comment</button>
                        </form>
                    </div>


                </div>

            </div>

        </div>
    </div>

    <div class="subcontain">
        <div class="rightgrid">

            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!
            </div>

            <div class="item one">ONE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item two">TWO Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item three">THREE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item four">FOUR Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item five">FIVE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item six">SIX Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item seven">SEVEN Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item eight">EIGHT Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item nine">NINE Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!</div>
            <div class="item ten">RIGHT CONTAINER Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa, quos!
            </div>

        </div>


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
        document.textform.firsttextarea.value="";

        elmnt2.appendChild(cln);
    };
</script>
</body>



</html>
