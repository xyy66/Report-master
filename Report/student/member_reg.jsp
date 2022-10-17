<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="$link.setRelative('/manage/js/calendar/calendar.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/calendar/lang/en.js')"></script>
<link href="$link.setRelative('/manage/js/calendar/jscal2.css')" rel="stylesheet" type="text/css" />
<link href="$link.setRelative('/manage/js/calendar/border-radius.css')" rel="stylesheet" type="text/css" />
<link href="$link.setRelative('/manage/js/calendar/win2k.css')" rel="stylesheet" type="text/css" />
<style type="text/css">
.form dt {float: left;width: 20%;font-size: 14px;padding: 3px 0 0 0;color: #666;}
</style>

<script type="text/javascript">
function change_code(obj){
	jQuery("#code").attr("src",obj.src+'?'+Math.random());
	return false;
}

jQuery(function () {
	jQuery("input[name='member.accountid']").focus();
	
	//验证用户名是否存在
	jQuery("input[name='member.accountid']").blur(function(){
		var accountid = jQuery("input[name='member.accountid']");
		if(jQuery.trim(accountid.val())==''){
			accountid.parent().find("span").remove().end().append("<span class='error'>用户名不能为空</span>");
			return ;
		}
		jQuery.post("$link.setAction('verifyMember')",{accountid:jQuery.trim(accountid.val())},
			function(msg){
				if(msg != ""){
					accountid.focus();
					accountid.parent().find("span").remove().end().append("<span style='color: red;'>"+msg+"</span>");
				}else{
					accountid.parent().find("span").remove().end().append("<span style='color: green;'>用户名可用</span>");
				}
			}
		);
	});
	
	jQuery("#form_do").submit(function(){
		var accountid = jQuery("input[name='member.accountid']");
		var password = jQuery("input[name='member.password']");
		var password_re = jQuery("input[name='member.password_re']");
		var factname = jQuery("input[name='member.factname']");
		var email = jQuery("input[name='member.email']");
		var imagecode = jQuery("input[name='member.imagecode']");
		if(jQuery.trim(accountid.val())==''){
			accountid.parent().find("span").remove().end().append("<span class='error'>用户名不能为空</span>");
			accountid.focus();
			return false;			
		}else {
			accountid.parent().find("span").remove().end();
		}
		if(jQuery.trim(password.val())==''){
			password.parent().find("span").remove().end().append("<span class='error'>登录密码不能为空</span>");
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
		if(jQuery.trim(factname.val())==''){
			factname.parent().find("span").remove().end().append("<span class='error'>姓名不能为空</span>");
			factname.focus();
			return false;			
		}else {
			factname.parent().find("span").remove().end();
		}
		if(jQuery.trim(email.val())==''){
			email.parent().find("span").remove().end().append("<span class='error'>邮箱不能为空</span>");
			email.focus();
			return false;			
		}else {
			email.parent().find("span").remove().end();
		}
		if(jQuery.trim(imagecode.val())==''){
			imagecode.parent().find("span").remove().end().append("<span class='error'>验证码不能为空</span>");
			imagecode.focus();
			return false;			
		}else {
			imagecode.parent().find("span").remove().end();
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
	<div class="right f_r" style="width:980px;">
		<h3 class="nybt"><span>会员注册</span></h3>
		<div class="form">
			<form method='post' id="form_do" name="form_do" style="width: 600px;margin: 22px auto 0;" action="$link.setAction('regMember')">
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input type="text" name="member.accountid" class="inp_one" />
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
					<dt>登录密码：</dt>
					<dd>
						<input type="password" name="member.password" class="inp_one" value=""/>
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
					<dt>确认密码：</dt>
					<dd>
						<input type="password" name="member.password_re" class="inp_one" value=""/>
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
					<dt>姓名/单位名称：</dt>
					<dd>
						<input type="text" name="member.factname" class="inp_one" />
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
        			<dt> 性别：</dt>
        			<dd>
        				<label><input type="radio" name="member.sex" value="1" checked="checked"/>男&nbsp;</label>
        				<label><input type="radio" name="member.sex" value="2" />女</label>
        			</dd>
        		</dl>
				<dl>
					<dt>身份证号：</dt>
					<dd>
						<input type="text" name="member.idcard" class="inp_one" />
					</dd>
				</dl>
				<dl>
                    <dt> 出生日期：</dt>
                    <dd>
                        <input type="text" class="inp_one" name="member.birthday" id="birthday" value="" readonly="readonly">
                        <script type="text/javascript">
                            Calendar.setup({
                                weekNumbers: true,
                                inputField : "birthday",
                                trigger    : "birthday",
                                dateFormat: "%Y-%m-%d",
                                showTime: true,
                                minuteStep: 1,
                                onSelect   : function() {this.hide();}
                            });
                        </script>
                    </dd>
                </dl>
				<dl>
					<dt>邮箱：</dt>
					<dd>
						<input type="text" name="member.email" class="inp_one" />
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
					<dt>QQ：</dt>
					<dd>
						<input type="text" name="member.qq" class="inp_one" />
					</dd>
				</dl>
				<dl>
					<dt>电话：</dt>
					<dd>
						<input type="text" name="member.tel" class="inp_one" />
					</dd>
				</dl>
				<dl>
					<dt>所在地：</dt>
					<dd>
						<input type="text" name="member.address" class="inp_one" />
					</dd>
				</dl>
				<dl>
					<dt>验证码：</dt>
					<dd>
						<input type="text" name="member.imagecode" class="inp_small" />
						<img src="$link.setAction('/manage/imageCode.do')" align="absmiddle" id="code"  class="vcode" onclick="change_code(this);"/>
						<span style="color: red;">*</span>
					</dd>
				</dl>
				<dl>
    				<span class='error'>#errorMarkup()</span>
                </dl>
				<div class="form_b">		
					<input type="submit" class="btn_blue" id="submit" value="注册">
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