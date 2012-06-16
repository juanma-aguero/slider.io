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

	{{#fontURL}}
  <link href='{{{fontURL}}}' rel='stylesheet'>
  {{/fontURL}}
  
	<link href="/css/highlight/solarized_dark.min.css" rel="stylesheet">
	<link href="/css/slider.css" rel="stylesheet">
	
	{{#editor}}
	<link href="/css/dark-hive/jquery-ui-1.8.20.custom.css" rel="stylesheet">
	<link href="/css/font-awesome.css" rel="stylesheet">
	<link href="/css/farbtastic/farbtastic.css" rel="stylesheet">
	<link href="/css/editor.css" rel="stylesheet">
	{{/editor}}
	
	<link href="styles.css" rel="stylesheet">
  
</head>
<body class="sliderCtn">
  <header>
		<div id="clients-holder"></div>
  </header>
  <div id="slider-stage">
  	<ul id="slider-list"></ul>
  </div>
  <footer></footer>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="/js/libs/jquery-1.7.1.min.js"><\/script>')</script>
	
	<script src="/js/libs/highlight.min.js"></script>
	<script src="/js/libs/mustache.js"></script>
	<script src="/js/libs/jquery.swipe.js"></script>
	<script src="/js/libs/jquery.slider.js"></script>
	
	<script src="/js/sliderio/service/slider.js"></script>
	<script src="/js/sliderio/view/partials.js"></script>
	
	{{#editor}}
	<script type="text/javascript" src="/js/libs/jquery-ui-1.8.20.custom.min.js"></script>
	<script type="text/javascript" src="/js/libs/farbtastic.js"></script>
	<script type="text/javascript" src="/js/libs/jquery.form.js"></script>
	
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
		
		{{/solo}}
	{{/editor}}
	
</body>
</html>




