<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
#parse("/manage/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<link type="text/css" rel="stylesheet" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery.cookie.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
##<script type="text/javascript" src="$link.setRelative('/manage/js1/cloud.js')"></script>

<style type="text/css">
.imagecode{
	width: 80px;
    border: 1px solid;
    height: 30px;
}
.systemlogo1{
	background:url("images1/logo.png") no-repeat left;
	width:100%; 
	height:71px; 
	margin-top:10px;
	margin-left: 20px;
	display:block;
}
.login {
    background: #fff;
    padding: 16px 34px 37px;
    width: 70%;
    margin: 0 auto;
}
.login .hd {
    border-bottom: 1px solid #ccc;
    height: 72px;
    margin-bottom: 20px;
}
.login .hd li.on {
    color: #2b9fd0;
}
.login .hd li {
    font: 20px/71px "微软雅黑";
    color: #2b9fd0;
    float: left;
    color: #666;
    width: 50%;
}
.login ul li{margin-bottom:10px;}
.login label {
    width: 120px;
    text-align: right;
    padding-right: 10px;
	display: block;
	float: left;
}
.login b {
    color: #ea2020;
    padding-left: 3px;
}
.login .reginput {
    width: 272px;
    height: 30px;
    line-height: 30px;
    border: 1px solid #ccc;
    padding-left: 10px;
    font-family: "微软雅黑";
    font-size: 14px;
    color: #666;
}
.login .logintype {
    width: 150px;
    height: 30px;
    line-height: 30px;
    border: 1px solid #ccc;
    font-family: "微软雅黑";
    font-size: 14px;
    color: #666;
}
.login .loginbutton {
    width: 200px;
    height: 40px;
    font-size: 16px;
    color: rgb(255, 255, 255);
    font-family: 微软雅黑;
    background: rgb(43, 159, 208);
}
</style>
<script language="javascript">
	jQuery(function(){
		jQuery("#username").focus();
		
    });
</script> 
<script type="text/javascript">
function change_code(obj){
	jQuery("#code").attr("src",obj.src+'?'+Math.random());
	return false;
}

jQuery(function () {
    jQuery("input[name='member.accountid']").focus();
	 
	//验证账号是否存在
	jQuery("input[name='member.accountid']").blur(function(){
		var accountid = jQuery("input[name='member.accountid']");
		if(jQuery.trim(accountid.val())==''){
			accountid.focus();
			accountid.parent().find("span").remove().end().append("<span style='color: red;'>账号不能为空</span>");
			return ;
		}
		jQuery.post("$link.setAction('verifyMemberReg')",{accountid:jQuery.trim(accountid.val())},
			function(msg){
				if(msg != ""){
					accountid.focus();
					accountid.parent().find("span").remove().end().append("<span style='color: red;'>"+msg+"</span>");
				}else{
					accountid.parent().find("span").remove().end().append("<span style='color: green;'>账号可用</span>");
				}
			}
		);
	});
     
     jQuery("#form_do").submit(function(){
		var accountid = jQuery("input[name='member.accountid']");
		var password = jQuery("input[name='member.password']");
		var password_re = jQuery("input[name='member.password_re']");
		var factname = jQuery("input[name='member.factname']");
		var idcard = jQuery("input[name='member.idcard']");
		var email = jQuery("input[name='member.email']");
		var imagecode = jQuery("input[name='member.imagecode']");
		if(jQuery.trim(accountid.val())==''){
			accountid.parent().find("span").remove().end().append("<span style='color: red;'>账号不能为空</span>");
			accountid.focus();
			return false;			
		}else {
			accountid.parent().find("span").remove().end();
		}
		if(jQuery.trim(password.val())==''){
			password.parent().find("span").remove().end().append("<span style='color: red;'>登录密码不能为空</span>");
			password.focus();
			return false;			
		}else {
			password.parent().find("span").remove().end();
		}
		if(jQuery.trim(password_re.val())==''){
			password_re.parent().find("span").remove().end().append("<span style='color: red;'>确认密码不能为空</span>");
			password_re.focus();
			return false;			
		}else {
			password_re.parent().find("span").remove().end();
		}
		if(jQuery.trim(factname.val())==''){
			factname.parent().find("span").remove().end().append("<span style='color: red;'>用户名称不能为空</span>");
			factname.focus();
			return false;			
		}else {
			factname.parent().find("span").remove().end();
		}
		/*
		if(jQuery.trim(idcard.val())==''){
			idcard.parent().find("span").remove().end().append("<span style='color: red;'>身份证号不能为空</span>");
			idcard.focus();
			return false;			
		}else {
			idcard.parent().find("span").remove().end();
		}
		if(jQuery.trim(email.val())==''){
			email.parent().find("span").remove().end().append("<span style='color: red;'>邮箱不能为空</span>");
			email.focus();
			return false;			
		}else {
			email.parent().find("span").remove().end();
		}
		*/
		if(jQuery.trim(imagecode.val())==''){
			imagecode.parent().find("span").remove().end().append("<span style='color: red;'>验证码不能为空</span>");
			imagecode.focus();
			return false;			
		}else {
			imagecode.parent().find("span").remove().end();
		}

	});
	
});


</script>

</head>

<body style="background-color:#1c77ac; background-image:url(images1/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

    <div class="loginbody">
		<span class="systemlogo1"></span> 
        <div class="login">
            <ul class="hd">
                <li class="on">注册页面</li>
                <li class="on"><a style="float: right;" href="javascript:void(0)" onclick="goUrl('$link.setAction('load4Login')')">返回登录</a></li>
            </ul>
			<form id="form_do" action="$link.setAction('regMember.do')" method="post" id="login">
                <ul>
            		<li>
            			<label>账号：<b>*</b></label>
            			<input type="text" name="member.accountid" class="reginput" value="$!addMemberForm.member.accountid"/>
            		</li>
            		<li>
            			<label>登录密码：<b>*</b></label>
            			<input type="password" name="member.password" class="reginput" value=""/>
            		</li>
            		<li>
            			<label>确认密码：<b>*</b></label>
            			<input type="password" name="member.password_re" class="reginput" value=""/>
                    </li>
            		<li>
            			<label>用户名称：<b>*</b></label>
            			<input type="text" name="member.factname" class="reginput" value="$!addMemberForm.member.factname"/>
                    </li>
            		<li>
            			<label>身份证号：</label>
            			<input type="text" name="member.idcard" class="reginput" value="$!addMemberForm.member.idcard"/>
                    </li>
            		<li>
            			<label>邮箱地址：</label>
            			<input type="text" name="member.email" class="reginput" value="$!addMemberForm.member.email"/>
                    </li>
                    <li>
            			<label>验证码：<b>*</b></label>
                		<input name="member.imagecode" type="text" class="reginput" style="width:200px;"/>
                		<img src="$link.setAction('imageCode.do')" align="absmiddle" id="code" onclick="change_code(this);"/>
                	</li>
                    <li style="clear:both">
						<label>&nbsp;</label>
                		<input type="submit" class="loginbutton" value="注册"/>
                	</li>
            		<li><span class="errorcolor">#errorMarkup()</span></li>
                </ul>
            </form>
        </div>
    
    </div>
    
    <div class="loginbm">#parse("/manage/include/copyright.vm")</div>
</body>
</html>
