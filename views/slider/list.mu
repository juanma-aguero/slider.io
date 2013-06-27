<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  
  {{#title}}
  <title>{{title}}</title>
	{{/title}}
	{{^title}}
	<title>Untitled</title>
	{{/title}}
  
	<meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">
  <meta name="viewport" content="width=device-width">

	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="/css/website.css" rel="stylesheet">  
</head>
<body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">Webenter</a>
                <div class="nav-collapse">
                  <ul class="nav">
                    <li class="active"><a href="/"><i class="icon-home icon-white"></i></a></li>
                    <li class=""><a href="/about">About</a></li>
                    <li class=""><a href="/about">Comunity</a></li>
                  </ul>
                    <ul class="nav pull-right">
                        <li class="dropdown" id="menu1">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#menu1">
                                <i class="icon-user icon-white"></i> Username
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Perfil</a></li>
                                <li><a href="#">Preferencias</a></li>
                                <li class="divider"></li>
                                <li><a href="/adminLogin/logout">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span7">
            <h2>Last public sliders</h2>
            <ul id="sliderList">
                {{#sliders}}
                <li data-sld="{{.}}" class="slider-row">
                  <span>{{.}}</span> <a href="/slider/{{.}}" title="View"><i class="icon-eye-open"></i></a> 
                           <a href="/slider/{{.}}/speaker" title="Broadcast"><i class="icon-play"></i></a>
                           <a href="/slider/{{.}}/editor" title="Edit"><i class="icon-edit"></i></a>
                           <a class="offline" target="_blank" title="Download"><i class="icon-download-alt"></i></a>
                </li>
                {{/sliders}}
            </ul>
        </div>
        <div class="span5">
        <div class="login-screen">
                <div class="login-icon">
                    <h4>Create <small>your</small> slider</h4>
                </div>
                <div class="login-form">
                    <form name="form" method="post" action="/slider/new">
                        <div class="control-group">
                            <input type="text" class="login-field" value="" placeholder="Enter the slider name" id="login-name" name="name" />
                            <label class="login-field-icon fui-man-16" for="login-name"></label>
                        </div>
                        <div class="control-group">
                            <input type="password" class="login-field" value="" placeholder="Passcode" id="login-pass" name="passcode" />
                            <label class="login-field-icon fui-lock-16" for="login-pass"></label>
                        </div>
                        <button class="btn btn-success btn-large btn-block" type="submit">Create</button>
                    </form>
                </div>
            </div>
        </div>
        
      </div>
    </div>
  
<script src="/js/libs/jquery-1.7.2.min.js"></script>	
<script src="/js/sliderio/service/slider.js"></script>
<script>
    $(document).ready(function(){
        $('a.offline').live('click', function(){
                var name = $(this).parents('li').attr('data-sld');

                authenticate(function(){
                        var formHtml = "<form action='/slider/" + name + "/offline' method='post'>"
                + "<input type='password' name='passcode' id='passcode'>"
                + "</form>";

        var form = $(formHtml);
        form.children('#passcode').val(sliderio.passcode);
        form.submit();

                }, name);	
        });
    });
</script>
</body>
</html>