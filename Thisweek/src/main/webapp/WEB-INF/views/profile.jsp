<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--    <link rel="stylesheet" href="src/main/webapp/timelineStyle.css">--%>
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
            background-color:rgb(165, 165, 165);
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
            color:#000000;
            background-color:rgb(107, 57, 57);
            padding:15px;
            border-radius:10px;
            margin:15px 0;
        }

        .post-head, .comments{
            display: grid;
            grid-template-columns: 0.3fr 2fr 0.3fr;
        }
        .comment-text-input{
            display: grid;
            grid-template-columns: 0.3fr 2fr;
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
            border:1px solid rgb(44, 44, 44);
            border-radius: 15px;
        }

        button{
            padding: 7px;
            border:1px solid rgb(44, 44, 44);
            border-radius: 5px;
            margin-top:10px;
            margin-right: 50px;
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
            <form action="" method="post" name="textform">
                    <textarea id="firsttextarea" style="resize: vertical; overflow: auto; height: auto; display:block;" name="post"
                              id="" cols="50" rows="3"></textarea>
                <!-- <button type="submit">Post</button> -->


            </form>
            <button type="submit" onclick="myFunction()" style="display:block;">Try it</button>


        </div>

        <div class="incenter">

            <div class="itemcenter" style=" display:none;">

                <div style="background-color:aqua;" class="post-head">
                    <div class="item1">
                    <div class=" profilepic"
                         style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(23, 0, 39); border-radius: 50%;">
                    </div>
                </div>
                <div class="item2 " style=" padding-left:3px; background-color:rgb(255, 0, 0)">
                    <div class="username">Username</div>
                    <div class="date">date of post</div>
                </div>
                <div class="item3" style="width:30px">OPT</div>

            </div>


            <div style="background-color:rgb(211, 66, 30)" class="post-body">Lorem ipsum dolor sit amet consectetur
                adipisicing elit. Quam quis blanditiis inventore saepe laboriosam maiores neque quod odit quaerat,
                vel quos debitis ab, architecto ipsum impedit consequatur omnis pariatur similique optio mollitia
                provident ducimus assumenda sunt. Quo sequi rem beatae culpa. Eius eum, aut provident voluptates
                culpa modi cum ullam fugiat possimus dicta libero officia fuga. Enim quis repudiandae quasi nostrum
                nulla dolorem cum quisquam necessitatibus iusto, similique error ad excepturi inventore! Velit
                voluptas ea, ipsa odit fugiat sint? Ad ea assumenda laborum inventore error, aliquid aspernatur
                omnis fugit dolorum? Suscipit rerum quis amet repellendus quos consequuntur, dignissimos omnis nam
                voluptates odio aperiam ipsa asperiores iste error consectetur explicabo corrupti eos dolorem
                voluptatem pariatur expedita! Accusamus nemo dolore, vero reiciendis consectetur necessitatibus
                molestiae. Non repellat, tempore adipisci est architecto error quibusdam iste temporibus beatae
                doloremque fuga quis. Doloribus nulla deleniti tempora quas placeat exercitationem magni
                reprehenderit excepturi nesciunt recusandae, esse incidunt, corporis illum consequuntur ut
                reiciendis officia amet molestias eaque eius iure. Placeat suscipit quod tenetur enim adipisci amet
                dolorum ullam! Eaque explicabo numquam voluptatibus enim repudiandae, labore odit ratione accusamus
                reiciendis laboriosam blanditiis consequuntur omnis inventore facilis quidem quisquam consectetur
                saepe odio ipsa! Reiciendis, qui. Aut nisi est repudiandae.</div>

            <div style="background-color:rgb(6, 66, 66)" class="post-reaction-numbers">
                <div class="num-of-likes">0</div>
                <div class="like-num">likes</div>
                <div class="num-of-comments">0</div>
                <div class="comment-num">comments</div>
            </div>

            <div style="background-color:rgb(19, 145, 14)" class="post-like-comment">
                <div class="like">LIKE</div>
                <div class="comment">COMMENT</div>
            </div>

            <div style="background-color:aqua;" class="comments">
                <div class="item1">
                <div class=" profilepic"
                     style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(23, 0, 39); border-radius: 50%;">
                </div>
            </div>
            <div class="item2 " style=" padding-left:3px; background-color:rgb(255, 0, 0)">
                <div class="username">Username</div>
                <div class="date">COMMENT</div>
            </div>
            <div class="item3">OPT</div>

        </div>

        <div style="background-color:aqua;" class="comment-text-input">
            <div class="item1">
            <div class=" profilepic"
                 style="margin-left: 5px; width:37px; height: 100%; background-color:rgb(23, 0, 39); border-radius: 50%;">
            </div>
        </div>
        <div class="item2 " style=" padding-left:3px; background-color:rgb(129, 39, 39)">
            <div class="username">Username</div>
            <div class="date">COMMENT</div>
        </div>


    </div>

</div>

<!-- <div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div>
<div class="itemcenter">
    <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil iusto quis non ex rem magnam
        voluptas ipsum sunt explicabo fugiat suscipit libero dolores eaque praesentium maiores, eos ducimus
        amet vel. Officiis facere dolorem est natus, voluptatem pariatur sunt ea ex eligendi nesciunt
        ratione deserunt possimus perferendis iste asperiores repudiandae vitae rem cum harum provident,
        quibusdam dolorum. Cumque placeat dolores, ipsam expedita magnam odio praesentium animi sapiente
        atque repudiandae aperiam temporibus nam nihil, dolor reiciendis ipsa, pariatur accusamus libero
        maiores vitae neque aut architecto quod doloremque. Excepturi at omnis repellendus, ea unde aliquid
        minima saepe, amet porro sequi natus quisquam suscipit.</div>
</div> -->

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
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>JSP - Hello World</title>--%>
<%--</head>--%>

<%--<body>--%>

<%--<h1>Welcome to your profile page</h1>--%>
<%--<h2>What would you like to do</h2>--%>
<%--</body>--%>
<%--</html>--%>