<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery.form.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/calendar.config.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.config.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.all.min.js')"></script>
<script type="text/javascript">
	window.UEDITOR_HOME_URL = "ueditor/";
	window.onload = function() {
		UE.getEditor('description', {
            initialFrameWidth : 800,
            initialFrameHeight: 400
        });
    }

</script>
<script type="text/javascript">
function change_code(obj){
	jQuery("#code").attr("src",obj.src+'?'+Math.random());
	return false;
}

jQuery(function () {
	jQuery("input[name='matchapply.annualmatch']").focus();
	
	var d = new Date();
	var year = d.getFullYear();
    jQuery("#annualmatch").val(year);
	
	jQuery("#form_do").submit(function(){
		var annualmatch = jQuery("input[name='matchapply.annualmatch']");
		var name = jQuery("input[name='matchapply.name']");
		var unitname = jQuery("input[name='matchapply.unitname']");
		var authors = jQuery("input[name='matchapply.authors']");
		var teachers = jQuery("input[name='matchapply.teachers']");
		var imagecode = jQuery("input[name='matchapply.imagecode']");
		var description = jQuery("#description");
		if(jQuery.trim(annualmatch.val())==''){
			annualmatch.parent().find("span").remove().end().append("<span class='errorcolor'>参赛年度不能为空</span>");
			annualmatch.focus();
			return false;			
		}else {
			annualmatch.parent().find("span").remove().end();
		}
		if(jQuery.trim(name.val())==''){
			name.parent().find("span").remove().end().append("<span class='errorcolor'>作品名称不能为空</span>");
			name.focus();
			return false;			
		}else {
			name.parent().find("span").remove().end();
		}
		if(jQuery.trim(unitname.val())==''){
			unitname.parent().find("span").remove().end().append("<span class='errorcolor'>学校名称不能为空</span>");
			unitname.focus();
			return false;			
		}else {
			unitname.parent().find("span").remove().end();
		}
		if(jQuery.trim(authors.val())==''){
			authors.parent().find("span").remove().end().append("<span class='errorcolor'>作者姓名不能为空</span>");
			authors.focus();
			return false;			
		}else {
			authors.parent().find("span").remove().end();
		}
		if(jQuery.trim(teachers.val())==''){
			teachers.parent().find("span").remove().end().append("<span class='errorcolor'>辅导老师不能为空</span>");
			teachers.focus();
			return false;			
		}else {
			teachers.parent().find("span").remove().end();
		}
		if(!UE.getEditor('description').hasContents()){
			description.parent().find("span").remove().end().append("<span class='errorcolor'>作品简述不能为空</span>");
			description.focus();
			return false;			
		}else {
			description.parent().find("span").remove().end();
		}
		if(jQuery.trim(imagecode.val())==''){
			imagecode.parent().find("span").remove().end().append("<span class='errorcolor'>验证码不能为空</span>");
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
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4MatchapplyIndex')">参赛报名管理</a></li>
            <li><a href="#">参赛报名修改</a></li>
        </ul>
    </div>
	<div class="formbody">
		<form method='post' id="form_do" name="form_do" action="$link.setAction('modifyMatchapply')" enctype="multipart/form-data">
		<ul class="forminfo">
            <li>
				<label>参赛年度(YYYY)：<b>*</b></label>
				<input type="text" id="annualmatch" name="matchapply.annualmatch" class="dfinput" style="width:200px;" value="$!modifyMatchapplyForm.matchapply.annualmatch"/>
			</li>
            <li>
				<label>参赛项目：<b>*</b></label>
				<select name="matchapply.matchid" class="dfinput" style="width:300px;">
					#set($matchinfoList = $request.getAttribute("matchinfoList"))
					#foreach($matchinfo in $matchinfoList)
						#if($!matchinfo.id==$!modifyMatchapplyForm.matchapply.matchid)
							<option value="$!matchinfo.id" selected="selected">$!matchinfo.name</option>
						#else
							<option value="$!matchinfo.id">$!matchinfo.name</option>
						#end
					#end
				</select>
			</li>
			<li>
				<label>作品名称：<b>*</b></label>
				<input type="text" name="matchapply.name" class="dfinput" style="width:600px;" value="$!modifyMatchapplyForm.matchapply.name"/>
			</li>
			<li>
				<label>学校名称：<b>*</b></label>
				<input type="text" name="matchapply.unitname" class="dfinput" style="width:600px;" value="$!modifyMatchapplyForm.matchapply.unitname"/>
			</li>
			<li>
				<label>作者姓名：<b>*</b></label>
				<input type="text" name="matchapply.authors" class="dfinput" style="width:300px;" value="$!modifyMatchapplyForm.matchapply.authors"/>
			</li>
			<li>
				<label>辅导老师：<b>*</b></label>
				<input type="text" name="matchapply.teachers" class="dfinput" style="width:300px;" value="$!modifyMatchapplyForm.matchapply.teachers"/>
			</li>
			<li>
				<label>作品简述：</label>
                <label style="margin-bottom: 13px;"><textarea name="matchapply.description" id="description">$!modifyMatchapplyForm.matchapply.description</textarea></label>
			</li>
			<li>
				<label>上传附件：</label>
				<input type="file" name="matchapply.upfile" style="width:400px;"/>
			</li>
			<li>
				<label>是否提交：<b>*</b></label>
				<label><input type="radio" name="matchapply.state" value="1" #if($!modifyMatchapplyForm.matchapply.state==1) checked="checked" #end />立即提交&nbsp;</label>
				<label><input type="radio" name="matchapply.state" value="0" #if($!modifyMatchapplyForm.matchapply.state==0) checked="checked" #end/>暂不提交</label>
			</li>
			<li>
				<label>验证码：<b>*</b></label>
				<input type="text" name="matchapply.imagecode" class="dfinput" style="width:100px;"  />
				<img src="$link.setAction('imageCode.do')" align="absmiddle" id="code" onclick="change_code(this);"/>
			</li>
			<li>
				<span class='errorcolor'>#errorMarkup()</span>
            </li>
            <li>
				<label>&nbsp;</label>
				<input type="hidden" name="matchapply.id" value="$!modifyMatchapplyForm.matchapply.id" />
				<input name="" type="submit" class="btn" value="保存"/>
				<input type="button" class="btn" id="back" value="返 回" onclick="javascript:history.back();" />
			</li>
        </ul>
        </form>
    </div>
</div>


</body>
</html>