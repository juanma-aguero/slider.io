<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  
    {{#title}}
        <title>{{title}} - viewer | Webenter</title>
    {{/title}}
    {{^title}}
	<title>Untitled - viewer | Webenter</title>
    {{/title}}
  
	<meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">
  <meta name="viewport" content="width=device-width">

	<link href="/css/highlight/solarized_dark.min.css" rel="stylesheet">
	<link href="/css/slider.css" rel="stylesheet">
	<link href="styles.css" rel="stylesheet">
  
</head>
<body >
<div class="sliderCtn">
    <header>
        <div id="clients-holder"></div>
    </header>
    <div id="slider-stage">
        <ul id="slider-list"></ul>
    </div>
</div>	
  <script src="/js/libs/jquery-1.7.2.min.js"></script>	
	<script src="/js/libs/highlight.min.js"></script>
	<script src="/js/libs/mustache.js"></script>
	<script src="/js/libs/jquery.swipe.js"></script>
	<script src="/js/libs/jquery.slider.js"></script>
	
	<script src="/js/sliderio/service/slider.js"></script>
	<script src="/js/sliderio/view/partials.js"></script>
	
	{{#scripts}}
            <script type="text/javascript">
                {{{scripts}}}
            </script>
	{{/scripts}}
	
        <script src="/socket.io/socket.io.js"></script>
        <script src="/js/listener.js"></script>
</body>
</html>




