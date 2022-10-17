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
</div>
<div class="clear"></div>

</div>

<div class="content">
	<div class="warp1 mt">
	<div class="left f_l">
		<h3 class="flbt">会员中心</h3>
		<div class="xbox">
			<ul class="fllb">
			<li><a href="$link.setAction('load4MemberIndex')">个人信息</a></li>
			<li><a href="$link.setAction('load4MemberModify')">修改资料</a></li>
			<li><a href="$link.setAction('load4MemberChgPwd')">修改密码</a></li>
			<li><a href="$link.setAction('logout')">退出登录</a></li>
			</ul>
		</div>		
	</div>
<div class="right f_r">
	<h3 class="nybt">
		<span>个人信息</span>
	</h3>
	<div class="form">
		<div class="h3">
			<span>基本资料</span>
		</div>
		#set($member = $request.getAttribute("member"))
		<dl>
    		<dt>用户名：</dt>
    		<dd>$!member.accountid</dd>
    	</dl>
		<dl>
    		<dt>姓名/单位名称：</dt>
    		<dd>$!member.factname</dd>
    	</dl>
		<dl>
    		<dt>性别：</dt>
    		<dd>#if($!member.sex==1)男#else女#end</dd>
    	</dl>
		<dl>
    		<dt>身份证号：</dt>
    		<dd>$!member.idcard</dd>
    	</dl>
		<dl>
    		<dt>出生日期：</dt>
    		<dd>$!member.birthday</dd>
    	</dl>
   		<div class="h3">
			<span>联系方式</span>
		</div>
		<dl>
    		<dt>邮箱：</dt>
    		<dd>$!member.email</dd>
    	</dl>
		<dl>
    		<dt>QQ：</dt>
    		<dd>$!member.qq</dd>
    	</dl>
		<dl>
    		<dt>电话：</dt>
    		<dd>$!member.tel</dd>
    	</dl>
		<dl>
    		<dt>所在地：</dt>
    		<dd>$!member.address</dd>
    	</dl>
	</div>

</div>
<div class=" clear"></div>
</div>
</div>

<div class="warp1 mt" id="bottom">
	#parse("/home/include/bottom.vm")
</div>

</body>
</html>
