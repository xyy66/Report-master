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
<script type="text/javascript">
jQuery(function () {
     jQuery("input[name='user.factname']").focus();
	 
     jQuery("#form_do").submit(function(){
		var factname = jQuery("input[name='user.factname']");
		if(jQuery.trim(factname.val())==''){
			factname.parent().find("span").remove().end().append("<span class='errorcolor'>姓名不能为空</span>");
			factname.focus();
			return false;			
		}else {
			factname.parent().find("span").remove().end();
		}

	});
	
});


</script>
</head>
<body>
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4UserIndex')">用户管理</a></li>
            <li><a href="#">修改用户</a></li>
        </ul>
    </div>
	<div class="formbody">
		<form method='post' id="form_do" name="form_do" action="$link.setAction('modifyUser')">
		<ul class="forminfo">
            <li>
				<label>用户名：<b>*</b></label>
				<span>$!modifyUserForm.user.username</span>
			</li>
			<li>
				<label>姓名：<b>*</b></label>
				<input type="text" name="user.factname" class="dfinput" style="width:300px;" value="$!modifyUserForm.user.factname"/>
			</li>
			<li>
				<label>性别：<b>*</b></label>
				<label style="width: 50px;"><input type="radio" name="user.sex" value="1" checked="checked"/>男&nbsp;</label>
				<label style="width: 50px;"><input type="radio" name="user.sex" value="2" />女</label>
			</li>
			<li>
				<label>邮箱：</label>
				<input type="text" name="user.email" class="dfinput" style="width:300px;" value="$!modifyUserForm.user.email"/>
			</li>
			<li>
				<label>QQ：</label>
				<input type="text" name="user.qq" class="dfinput" style="width:300px;" value="$!modifyUserForm.user.qq"/>
			</li>
			<li>
				<label>电话：</label>
				<input type="text" name="user.tel" class="dfinput" style="width:300px;" value="$!modifyUserForm.user.tel"/>
			</li>
			<li>
				<label>用户类型：</label>
				<select name="user.roleid" class="dfinput" style="width:300px;">
					#set($roleList = $request.getAttribute("roleList"))
					#foreach($role in $roleList)
						#if($!role.id==$!modifyUserForm.user.roleid)
							<option value="$!role.id" selected="selected">$!role.name</option>
						#else
							<option value="$!role.id">$!role.name</option>
						#end
					#end
				</select>
			</li>
			<li>
				<span class='errorcolor'>#errorMarkup()</span>
            </li>
            <li>
				<input type="hidden" name="user.id" value="$!modifyUserForm.user.id" />
    			<input type="hidden" name="user.isself" value="$!modifyUserForm.user.isself" />
    			<input type="submit" class="btn" id="submit" value="保存">
    			#if($!modifyUserForm.user.isself==0)
    			<input type="button" class="btn" id="back" value="返 回" onclick="javascript:history.back();" />
    			#end
			</li>
        </ul>
	   </form>
	</div>
</div>


</body>
</html>