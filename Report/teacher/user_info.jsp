<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel='stylesheet' type="text/css" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery.form.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/calendar.config.js')"></script>
<style type="text/css">
.h3{padding:5px; background:#C5E3FA; font-size:14px; font-weight:bold;border-left: 5px #0099FF solid;}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4UserIndex')">用户管理</a></li>
            <li><a href="#">查看用户信息</a></li>
        </ul>
    </div>
	<div class="formbody">
		<div class="h3">
			<span>基本资料</span>
		</div>
		#set($user = $request.getAttribute("user"))
		<ul class="forminfo">
			<li>
				<label>用户名：</label>
				<span>$!user.username</span>
			</li>
			<li>
				<label>姓名：</label>
				<span>$!user.factname</span>
			</li>
			<li>
				<label>性别：</label>
				<span>#if($!user.sex==1)男#else女#end</span>
			</li>
			<li>
				<label>用户类型：</label>
				<span>$!user.rolename</span>
			</li>
   		</ul>
   		<div class="h3">
			<span>联系方式</span>
		</div>
		<ul class="forminfo">
			<li>
				<label>邮箱：</label>
				<span>$!user.email</span>
			</li>
			<li>
				<label>QQ：</label>
				<span>$!user.qq</span>
			</li>
			<li>
				<label>电话：</label>
				<span>$!user.tel</span>
			</li>
			<li>
        		<input type="button" class="btn" id="back" value="返 回" onclick="javascript:history.back();" />
            </li>
		</ul>
	</div>
</div>


</body>
</html>