<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.parse.min.js')"></script>
</head>

<body>
<!--top -->
<div id="top">
<div class="warp" id="herd">
	<div id="top_fla">
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="998" height="159">
	  <param name="movie" value="$link.setRelative('/home/theme/default/images/top.swf')" />
	  <param name="quality" value="high" />
	  <PARAM NAME=wmode value="transparent">
	  <embed src="$link.setRelative('/home/theme/default/images/top.swf')" quality="high" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="998" height="159"></embed>
	</object>
	</div>
	<div id="top_member">
		#parse("/home/include/top_member.vm")
	</div>
	<div id="top_logo"></div>
</div>
<!--menu -->
<div id="menu">
	<ul>
		#parse("/home/include/menu.vm")
	</ul>
</div>

<div class="warp1 mt">
	#parse("/home/include/announce.vm")
</div>
<div class="clear"></div>

</div>

<div class="content">
	<div class="warp1 mt">

<div class="left f_l">
	<h3 class="left_bt">联系我们</h3>
	<div class="xbox left_contactbox">
	  #parse("/home/include/about.vm")
	</div>
</div>
<div class="right f_r">
	<h3 class="nybt">
		<i>您当前的位置：<a href="$link.contextPath">首页</a> >> <a href="$link.setAction('load4Message')">通知</a></i>
		<span>通知</span>
	</h3>
	<div class="xbox wzzw"> 
		#set($message = $request.getAttribute("message"))
		<div class="biaoti" align="center">$!message.title</div>
		<div class="biaoti_sub">
			<span>$!message.author</span>
			<span>$!message.publishtime</span>
		</div>
		<div class="wzzw lh" id="content">
			$!message.content
		</div>
	</div>

	</div>
<div class=" clear"></div>
</div>
</div>


<div class="warp1 mt" id="bottom">
	#parse("/home/include/bottom.vm")
</div>
<script type="text/javascript">
	uParse('#content', {
        rootPath: '../'
    });

</script>

</body>
</html>