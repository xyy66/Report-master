<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript">
jQuery(function () {
	jQuery("input[name='member.password_old']").focus();
	
	jQuery("#form_do").submit(function(){
		var password_old = jQuery("input[name='member.password_old']");
		var password = jQuery("input[name='member.password']");
		var password_re = jQuery("input[name='member.password_re']");
		if(jQuery.trim(password_old.val())==''){
			password_old.parent().find("span").remove().end().append("<span class='error'>当前密码不能为空</span>");
			password_old.focus();
			return false;			
		}else {
			password_old.parent().find("span").remove().end();
		}
		if(jQuery.trim(password.val())==''){
			password.parent().find("span").remove().end().append("<span class='error'>新密码不能为空</span>");
			password.focus();
			return false;			
		}else {
			password.parent().find("span").remove().end();
		}
		if(jQuery.trim(password_re.val())==''){
			password_re.parent().find("span").remove().end().append("<span class='error'>确认密码不能为空</span>");
			password_re.focus();
			return false;			
		}else {
			password_re.parent().find("span").remove().end();
		}

	});
	
});
</script>
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
<h3 class="nybt"><span>修改密码</span></h3>
<div class="form">
	<form method='post' id="form_do" name="form_do" action="$link.setAction('chgMemberPwd')">
		<dl>
			<dt>当前密码：</dt>
			<dd>
				<input type="password" name="member.password_old" class="inp_one" />
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<dt>新密码：</dt>
			<dd>
				<input type="password" name="member.password" class="inp_one" />
				<span style="color: red;">*</span>
			</dd>
		</dl>

		<dl>
			<dt>确认新密码：</dt>
			<dd>
				<input type="password" name="member.password_re" class="inp_one" />
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<span class='error'>#errorMarkup()</span>
        </dl>
		<div class="form_b">
			<input type="submit" class="btn_blue" id="submit" value="保存">		
		</div>
	</form>
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
