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

	<link href="/css/highlight/solarized_dark.min.css" rel="stylesheet">
	<link href="/css/slider.css" rel="stylesheet">

        {{^editor}}
	<link href="/css/chatbox.css" rel="stylesheet">
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        {{/editor}}
	
	{{#editor}}
        <link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="/css/smoothness/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href="/css/font-awesome.css" rel="stylesheet">
	<link href="/css/farbtastic/farbtastic.css" rel="stylesheet">
	<link href="/css/select2/select2.css" rel="stylesheet">
	<link href="/css/editor.css" rel="stylesheet">
	{{/editor}}
	
	<link href="styles.css" rel="stylesheet">
  
</head>
{{#editor}}
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
                    <li class="active"><a href="/"><i class="icon-home"></i></a></li>
                  </ul>
                </div>
            </div>
        </div>
    </div>
	<div class="left-sideCtn">
		<div class="sliderCtn sliderWrapper">
		  <div id="slider-stage">
		  	<ul id="slider-list"></ul>
		  </div>
		</div>
		<div id="detailsEditorCtn">
			<h3>Slide Details</h3>
			<textarea id="detailsEditor"></textarea>
		</div>
	</div>
	<div id="mainConfigs">
		<div class="cfg-header">
			<h1>Configurations</h1>
		</div>
		<div class="content"></div>
	</div>
{{/editor}}
{{^editor}}
<body class="sliderCtn">
    <header>
        <div id="clients-holder"></div>
    </header>
    <div id="slider-stage">
        <ul id="slider-list"></ul>
    </div>
{{/editor}}

  <script src="/js/libs/jquery-1.7.2.min.js"></script>	
	<script src="/js/libs/highlight.min.js"></script>
	<script src="/js/libs/mustache.js"></script>
	<script src="/js/libs/jquery.swipe.js"></script>
	<script src="/js/libs/jquery.slider.js"></script>
	
	<script src="/js/sliderio/service/slider.js"></script>
	<script src="/js/sliderio/view/partials.js"></script>
	
	{{#editor}}
	<script type="text/javascript" src="/js/libs/jquery-ui-1.8.21.custom.min.js"></script>
	<script type="text/javascript" src="/js/libs/farbtastic.js"></script>
	<script type="text/javascript" src="/js/libs/select2.min.js"></script>
	<script type="text/javascript" src="/js/libs/jquery.form.js"></script>
	<script type="text/javascript" src="/js/libs/jquery.styleManager.js"></script>
	
	<script src="/js/sliderio/view/status.js"></script>
	<script src="/js/sliderio/view/toolbox.js"></script>
	<script src="/js/sliderio/view/resources.js"></script>
	<script src="/js/sliderio/view/editor/slider.js"></script>
	<script src="/js/sliderio/view/editor/config.js"></script>
	
	<script type="text/javascript" src="/js/editor.js"></script>
	{{/editor}}
	
	{{#scripts}}
            <script type="text/javascript">
                {{{scripts}}}
            </script>
	{{/scripts}}
	
	{{^editor}}
		{{#solo}}
                    <script src="/js/solo.js"></script>
                    <script src="/js/speaker.js"></script>
		{{/solo}}
		
		{{^solo}}
                    <script src="/socket.io/socket.io.js"></script>
                    <script src="/js/listener.js"></script>
                    {{#speaker}}
                        <script src="/js/speaker.js"></script>
                    {{/speaker}}
                    
                    <div id="chatbox">
                        <div id="chatheader">
                            <span>Chatroom</span>
                            <i class="icon-comment" id="newmsg"></i>
                            <a class="link pull-right"><i class="icon-minus icon-white"></i></a>
                        </div>
                        <div id="chatroom"></div>
                        <div id="tell-me-username">
                            <input id="username" type="text" placeholder="Who are you?">
                            <button id="setusername" class="btn">Ready</button></div>
                        <div id="controls">
                            <textarea id="chatmsg"></textarea>
                            <button id="chatmsg-send" class="btn">Send</button>
                        </div>
                    </div>

		{{/solo}}
	{{/editor}}
	
</body>
</html>




