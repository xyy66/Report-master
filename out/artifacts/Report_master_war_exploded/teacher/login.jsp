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
    width: 308px;
    margin-top: 10px;
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
.login .loginuser1 {
    width: 272px;
    height: 40px;
    line-height: 40px;
    border: 1px solid #ccc;
    padding-left: 34px;
    font-family: "微软雅黑";
    font-size: 14px;
    color: #666;
    background: url("images1/loginuser1.png") no-repeat 12px center;
}
.login .loginpwd1 {
    background-image: url("images1/loginpwd1.png");
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
    width: 308px;
    height: 40px;
    font-size: 16px;
    color: rgb(255, 255, 255);
    font-family: 微软雅黑;
    background: rgb(43, 159, 208);
}

.gonggao {
    background: #fff;
    padding: 16px 34px 37px;
    width: 60%;
	min-height:200px;
    margin-top: 10px;
}
.gonggao .hd {
    border-bottom: 1px solid #ccc;
    height: 72px;
    margin-bottom: 20px;
}
.gonggao .hd li.on {
    color: #2b9fd0;
}
.gonggao .hd li {
    font: 20px/71px "微软雅黑";
    color: #2b9fd0;
    float: left;
    color: #666;
    width: 50%;
}
</style>
<script language="javascript">
    function change_code(obj){
    	jQuery("#code").attr("src",obj.src+'?'+Math.random());
    	return false;
    }

	jQuery(function(){
		jQuery("#username").focus();

		/**
        jQuery('.loginbox').css({'position':'absolute','left':(jQuery(window).width()-692)/2});
    	jQuery(window).resize(function(){  
        	jQuery('.loginbox').css({'position':'absolute','left':(jQuery(window).width()-692)/2});
    	});
		*/
		
		if (jQuery.cookie("rememberMe") == "1") {
            jQuery("#rememberMe").attr("checked", "checked");
            jQuery("#logintype").val(jQuery.cookie("logintype"));
            jQuery("#username").val(jQuery.cookie("username"));
        }
		
		jQuery("#form_do").submit(function(){
			var username = jQuery("input[name='username']");
			var password = jQuery("input[name='password']");
			var imagecode = jQuery("input[name='imagecode']");
			if(jQuery.trim(username.val())==''){
    			username.parent().find("span").remove().end().append("<span style='color: red;'>用户名不能为空</span>");
    			username.focus();
    			return false;			
    		}else {
    			username.parent().find("span").remove().end();
    		}
    		if(jQuery.trim(password.val())==''){
    			password.parent().find("span").remove().end().append("<span style='color: red;'>登录密码不能为空</span>");
    			password.focus();
    			return false;			
    		}else {
    			password.parent().find("span").remove().end();
    		}
			if(jQuery.trim(imagecode.val())==''){
    			imagecode.parent().find("span").remove().end().append("<span style='color: red;'>验证码不能为空</span>");
    			imagecode.focus();
    			return false;			
    		}else {
    			imagecode.parent().find("span").remove().end();
    		}
		
    		if (jQuery("#rememberMe").is(":checked") == true) {
                var username = jQuery("#username").val();
                var logintype = jQuery("#logintype").val();
                jQuery.cookie("rememberMe", "1", { expires: 7 }); // 存储一个带7天期限的 cookie
                jQuery.cookie("username", username, { expires: 7 }); // 存储一个带7天期限的 cookie
                jQuery.cookie("logintype", logintype, { expires: 7 }); // 存储一个带7天期限的 cookie
            }
            else {
                jQuery.cookie("rememberMe", "0", { expires: -1 });
                jQuery.cookie("username", '', { expires: -1 });
                jQuery.cookie("logintype", '', { expires: -1 });
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
        <div class="login" style="position:absolute;right:20px">
            <ul class="hd">
                <li class="on">用户登录</li>
            </ul>
			<form action="$link.setAction('login.do')" method="post" name="form_do" id="form_do">
                <ul>
                    <li><input id="username" name="username" type="text" class="loginuser1"/></li>
                    <li><input name="password" type="password" class="loginuser1 loginpwd1"/></li>
                    <li>
                		<input name="imagecode" type="text" class="loginuser1 loginpwd1" style="width: 200px;"/>
                		<img src="$link.setAction('imageCode.do')" align="absmiddle" id="code" onclick="change_code(this);"/>
                	</li>
                	<li>
                		<label style="padding-left:0px;font-size: 14px;">用户类型：</label>
                		<select id="logintype" name="logintype" class="logintype">
                			<option value="1" selected="selected">学生</option>
                			<option value="2">教师</option>
                		</select>
                    </li>
                    <li style="clear:both">
                		<input type="submit" class="loginbutton" value="登录"/>
                	</li>
					<li>
						<label style="float: left;font-size: 14px;"><input type="checkbox" id="rememberMe" />记住用户名</label>
						<a style="float: right;" href="javascript:void(0)" onclick="goUrl('$link.setAction('load4MemberReg')')">注册</a>
                    </li>
                    <li><span class="errorcolor">#errorMarkup()</span></li>
                </ul>
            </form>
        </div>
		<div class="gonggao" style="position:absolute;left:20px">
			<ul class="hd">
                <li class="on">最新公告</li>
            </ul>
            <ul class="newlist" style="padding-top: 0px;">
    			#set($announceList = $request.getAttribute("announceList"))
    			#foreach($announce in $announceList)
                <li><a target="_blank" href="$link.setAction('load4Announce').addQueryData('id',$!announce.id)">$!announce.title</a><b>$!announce.publishtime</b></li>
    			#end
            </ul>
        </div>
    
    </div>
    
    
    
    <div class="loginbm">#parse("/manage/include/copyright.vm")</div>
</body>
</html>
