<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  

        header {
            background: whitesmoke;
            display: flex;
            align-items: center;


        }

        .main  a {
			font:120px;
            text-decoration: none;
             font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background: linear-gradient(100deg, orange, white, green);
            -webkit-background-clip: text;
            /* background-clip: text; */
            -webkit-text-fill-color: transparent;
        }

        .main a:hover {
            background: linear-gradient(45deg, red, blue, orange);
            -webkit-background-clip: text;
            /* background-clip: text; */
            -webkit-text-fill-color: transparent;



        }

        .logo>a>img {

            width: 4rem;
        }

        header>h1 
        {
            font-size: i50px;
        }

        header>div {}

        .teal {
            background: black;
            height: 40px;
        }

        .container {
        	background:whitesmoke;
            display: flex;
            padding-left: 35%;
            align-items: center;

        }


        div.container a {
            color: black;
            text-decoration: none;
            font: 20px Raleway;
            margin: 0px 10px;
            padding: 10px 10px;
            position: relative;
            z-index: 0;
            cursor: pointer;
        }

        div.container a:hover {

            background: linear-gradient(100deg, orange, white, green);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Border from Y to X  */
        div.borderYtoX a:before,
        div.borderYtoX a:after {
            position: absolute;
            opacity: 0.5;
            height: 100%;
            width: 2px;
            content: '';
            background: #FFF;
            transition: all 0.3s;
        }

        div.borderYtoX a:before {
            left: 0px;
            top: 0px;
        }

        div.borderYtoX a:after {
            right: 0px;
            bottom: 0px;
        }

        div.borderYtoX a:hover:before,
        div.borderYtoX a:hover:after {
            opacity: 1;
            height: 2px;
            width: 100%;
        }
        header .logo {
            margin-left: 3rem;
        }
        
        
        .animate-charcter {
            text-transform: uppercase;
            background-image: linear-gradient(-225deg,
                    #231557 0%,
                    #44107a 29%,
                    #ff1361 67%,
                    #fff800 100%);
            background-size: auto auto;
            background-clip: border-box;
            background-size: 200% auto;
            color: #fff;
            background-clip: text;
            text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: textclip 2s linear infinite;
            display: inline-block;
            font-size: 2.5rem;
    		font-weight: bolder;
        }

        @keyframes textclip {
            to {
                background-position: 200% center;
            }
        }
        </style>

</head>
<body>

 <header>
 <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
        <div class="logo">
            <a href=""> <img src="photos/swimatologo.png"></a>
        </div>
       <a class="animate-charcter">SWIMATO</a>
        <div class="container teal borderYtoX">
            <div class="right">
                <a>HOME</a>
                <a>ARTICLES</a>
                <a>PORTFOLIO</a>
                <a>ABOUT</a>
                <a>CONTACT</a>
            </div>
        </div>
    </header>

</body>
</html>