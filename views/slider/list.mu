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
                  </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span7">
            <h2>Public Sliders</h2>
            <ul id="sliderList">
                {{#sliders}}
                <li data-sld="{{.}}">
                  <h3>{{.}} - <a href="/slider/{{.}}">viewer</a> 
                          | <a href="/slider/{{.}}/solo">solo</a> 
                          | <a href="/slider/{{.}}/speaker">speaker</a>
                          | <a href="/slider/{{.}}/editor">editor</a>
                          | <a class="offline" target="_blank">offline</a>
                    </h3>
                </li>
                {{/sliders}}
            </ul>
        </div>
        <div class="span5 well" style="opacity:0.9;">
            <h2>New Slider</h2>
            <form action="/slider/new" method="post" class="new-slider">
                <fieldset>
                    <input id="name" name="name" class="span10" type="text" placeholder="Name"/>
                    <input id="passcode" name="passcode" class="span6" type="text" placeholder="Passcode"/>
                    <input id="title" name="title" type="text" class="span10" placeholder="title"/>
                    <textarea id="description" name="description" class="input-xlarge span10" rows="3" placeholder="Description"></textarea>
                    <input type="submit" value="Create!" class="btn btn-large btn-success offset2"> 
                </fieldset>
            </form>
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