
<head>
    <meta charset="es">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/estilo1.css">
    <link rel="stylesheet" href="boostrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="engine1/style.css"/>
    <script type="text/javascript" src="engine1/jquery.js"></script>

</head >

<div class="container">
    <div class="fondo">
        <div class="row">          

            <div class="col-md-12">
                <div class="texto1">
                    <p>Bienvenidos "NetMaster"</p>
                </div>
                <div class="texto2">
                    <p>De: Jorge Anthonio ,Ticlavilca Chav&eacute;z</p>
                </div>
            </div>


        </div>
        <br>
    </div>        
</div>
<body>
    <jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
<article>
    <div class="container">
        <div class="container alert-success" id="login">
            <div class="row">
                <div class="col-md-12">
                    <h1 class=" form-signin-heading"><center><strong class="inicio">Inicio</strong></center></h1>
                    <br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <form action="control" method="post">
                        <div class="form-group">
                            <%/*<div class="input-group">
                             <%/*<span class="input-group-addon">@</span>*/%>
                            <input type="usuario" class="form-control" placeholder="Usuario" name="usuario" required autofocus>
                            <%/*</div>*/%>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Contrase&ntilde;a" name="password" required>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                            <strong>Iniciar seci&oacute;n</strong>
                        </button>
                            ${mensaje}
                    </form>
                </div>
            </div>  
        </div>


    </div>


</article>  
<aside class="slider">
    <div id="wowslider-container1">
        <div class="ws_images"><ul>
                <li><img src="data1/images/5..png" alt="" title="" id="wows1_0"/></li>
                <li><img src="data1/images/6..png" alt="" title="" id="wows1_1"/></li>
                <li><img src="data1/images/7..png" alt="" title="" id="wows1_2"/></li>
                <li><img src="data1/images/8..png" alt="" title="" id="wows1_3"/></li>
                <li><img src="data1/images/9..png" alt="" title="" id="wows1_4"/></li>
                <li><img src="data1/images/10..png" alt="" title="" id="wows1_5"/></li>
                <li><img src="data1/images/11..png" alt="" title="" id="wows1_6"/></li>
                <li><img src="data1/images/12..png" alt="" title="" id="wows1_7"/></li>
                <li><img src="data1/images/img1..png" alt="" title="" id="wows1_8"/></li>
                <li><img src="data1/images/img2..png" alt="" title="" id="wows1_9"/></li>
                <li><img src="data1/images/1..png" alt="" title="" id="wows1_10"/></li>
                <li><a href="http://wowslider.com/vf"><img src="data1/images/2..png" alt="full screen slider" title="" id="wows1_11"/></a></li>
                <li><img src="data1/images/4..png" alt="" title="" id="wows1_12"/></li>
            </ul></div>
        <div class="ws_bullets"><div>
                <a href="#" title=""><img src="data1/tooltips/5..png" alt=""/>1</a>
                <a href="#" title=""><img src="data1/tooltips/6..png" alt=""/>2</a>
                <a href="#" title=""><img src="data1/tooltips/7..png" alt=""/>3</a>
                <a href="#" title=""><img src="data1/tooltips/8..png" alt=""/>4</a>
                <a href="#" title=""><img src="data1/tooltips/9..png" alt=""/>5</a>
                <a href="#" title=""><img src="data1/tooltips/10..png" alt=""/>6</a>
                <a href="#" title=""><img src="data1/tooltips/11..png" alt=""/>7</a>
                <a href="#" title=""><img src="data1/tooltips/12..png" alt=""/>8</a>
                <a href="#" title=""><img src="data1/tooltips/img1..png" alt=""/>9</a>
                <a href="#" title=""><img src="data1/tooltips/img2..png" alt=""/>10</a>
                <a href="#" title=""><img src="data1/tooltips/1..png" alt=""/>11</a>
                <a href="#" title=""><img src="data1/tooltips/2..png" alt=""/>12</a>
                <a href="#" title=""><img src="data1/tooltips/4..png" alt=""/>13</a>
            </div></div><span class="wsl"><a href="http://wowslider.com">slideshow</a> by WOWSlider.com v6.4</span>
        <div class="ws_shadow"></div>
    </div>	
    <script type="text/javascript" src="engine1/wowslider.js"></script>
    <script type="text/javascript" src="engine1/script.js"></script>
    <!-- End WOWSlider.com BODY section -->
</aside>




<!-- Latest compiled and minified JavaScript -->
<script src="jquery/jquery-1.11.2.min.js"></script>
<script src="boostrap/js/bootstrap.js"></script>
</body>
</html>
