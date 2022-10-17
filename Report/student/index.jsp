<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
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

	<div id="syxw" class="f_l">
	<p>
		#set($about = $request.getAttribute("about"))
		$!about.description
		<a href="$link.setAction('load4WebAbout')">[详情]</a>
	</p>
	</div>
	<div id="banner" class="f_r">

	<div id="banBox">
		<ul id="banContentID">
			<li><a href="javascript:void(0)"><img border="0" src="$link.setRelative('/home/theme/default/images/p1.jpg')" width="722" height="257"/></a></li>
			<li><a href="javascript:void(0)"><img border="0" src="$link.setRelative('/home/theme/default/images/p2.jpg')" width="722" height="257"/></a></li>
		</ul>
	</div>
	<ul id="banNumID">
		<li class="">1</li>
		<li class="">2</li>
		<li class="">3</li>
	</ul>
	</div>
</div>
</div>

<div class="warp1 mt">
<div class="left f_l">
	<h3 class="left_bt">近期通知</h3>
	<div class="xbox left_box" id="abt" style='min-height: 300px; overflow:hidden;'>
	<ul class="sywz">
		#set($messageList = $request.getAttribute("messageList"))
		#foreach($message in $messageList)
			<li><a href="$link.setAction('showMessage').addQueryData('id',$!message.id)">$!message.title</a></li>
		#end
	</ul>
</div>	

</div>

<div class="right f_r">
	<h3 class='r_bt'>
		<a href="$link.setAction('load4News')">更多>></a>
		<span>新闻资讯</span></h3>
		<div class='xbox' style='min-height: 300px; overflow:hidden;'>
			<ul class='sywz'>
				#set($newsList = $request.getAttribute("newsList"))
				#foreach($news in $newsList)
					<li><span>$!news.publishtime</span><a href="$link.setAction('showNews').addQueryData('id',$!news.id)">$!news.title</a></li>
        		#end
            </ul>
		</div>
	</h3>
<div class=" clear"></div>
</div>
<div class=" clear"></div>
</div>

<div class="warp1 mt">
<h3 class="r_bt"><span>友情链接</span></h3>
<div class="xbox" id="yqlj">
	#parse("/home/include/link.vm")
<div class="clear"></div>
</div>
</div>
<script language="javascript" src="$link.setRelative('/home/js/MSClass.js')"></script>
<script type="text/javascript">
new Marquee({MSClass:["banBox","banContentID","banNumID"],Direction:0,Step: 0.3,Width:722,Height:257,Timer:20,DelayTime:2000,WaitTime:0,ScrollStep:257,SwitchType: 0,AutoStart:1});
</script>


<div class="warp1 mt" id="bottom">
	#parse("/home/include/bottom.vm")
</div>
	
</body>
</html>