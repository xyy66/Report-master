<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery.form.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.config.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.all.min.js')"></script>
<script type="text/javascript">
	
	window.UEDITOR_HOME_URL = "ueditor/";
	window.onload = function() {
		UE.getEditor('description', {
            initialFrameWidth : 600,
            initialFrameHeight: 300
        });
    }



</script>
<script type="text/javascript">
function change_code(obj){
	jQuery("#code").attr("src",obj.src+'?'+Math.random());
	return false;
}

jQurey(function () {
	jQuery("input[name='matchapply.annualmatch']").focus();
	
	jQuery("#form_do").submit(function(){
		var annualmatch = jQuery("input[name='matchapply.annualmatch']");
		var name = jQuery("input[name='matchapply.name']");
		var unitname = jQuery("input[name='matchapply.unitname']");
		var authors = jQuery("input[name='matchapply.authors']");
		var teachers = jQuery("input[name='matchapply.teachers']");
		var imagecode = jQuery("input[name='matchapply.imagecode']");
		var description = jQuery("#description");
		if(jQuery.trim(annualmatch.val())==''){
			annualmatch.parent().find("span").remove().end().append("<span class='error'>参赛年度不能为空</span>");
			annualmatch.focus();
			return false;			
		}else {
			annualmatch.parent().find("span").remove().end();
		}
		if(jQuery.trim(name.val())==''){
			name.parent().find("span").remove().end().append("<span class='error'>作品名称不能为空</span>");
			name.focus();
			return false;			
		}else {
			name.parent().find("span").remove().end();
		}
		if(jQuery.trim(unitname.val())==''){
			unitname.parent().find("span").remove().end().append("<span class='error'>学校名称不能为空</span>");
			unitname.focus();
			return false;			
		}else {
			unitname.parent().find("span").remove().end();
		}
		if(jQuery.trim(authors.val())==''){
			authors.parent().find("span").remove().end().append("<span class='error'>作者姓名不能为空</span>");
			authors.focus();
			return false;			
		}else {
			authors.parent().find("span").remove().end();
		}
		if(jQuery.trim(teachers.val())==''){
			teachers.parent().find("span").remove().end().append("<span class='error'>辅导老师不能为空</span>");
			teachers.focus();
			return false;			
		}else {
			teachers.parent().find("span").remove().end();
		}
		if(!UE.getEditor('description').hasContents()){
			description.parent().find("span").remove().end().append("<span class='error'>作品简述不能为空</span>");
			description.focus();
			return false;			
		}else {
			description.parent().find("span").remove().end();
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
		<h3 class="flbt">参赛报名</h3>
		<div class="xbox">
			<ul class="fllb">
			<li><a href="$link.setAction('load4MatchapplyAdd')">参赛报名</a></li>
			<li><a href="$link.setAction('load4MatchapplyIndex')">报名列表</a></li>
			</ul>
		</div>		
	</div>
<div class="right f_r">
<h3 class="nybt"><span>参赛报名修改</span></h3>
<div class="form">
	<form method='post' id="form_do" name="form_do" action="$link.setAction('modifyMatchapply')">
		<dl>
			<dt>参赛年度：</dt>
			<dd>
				<input type="text" id="annualmatch" name="matchapply.annualmatch" class="inp_one" value="$!modifyMatchapplyForm.matchapply.annualmatch"/>
				<span style="color: red;">*(格式：YYYY)</span>
			</dd>
		</dl>
		<dl>
			<dt> 参赛项目：</dt>
			<dd>
				<select name="matchapply.matchid">
					#set($matchinfoList = $request.getAttribute("matchinfoList"))
					#foreach($matchinfo in $matchinfoList)
						#if($!matchinfo.id==$!modifyMatchapplyForm.matchapply.matchid)
							<option value="$!matchinfo.id" selected="selected">$!matchinfo.name</option>
						#else
							<option value="$!matchinfo.id">$!matchinfo.name</option>
						#end
					#end
				</select>
			</dd>
		</dl>	
		<dl>
			<dt>作品名称：</dt>
			<dd>
				<input type="text" name="matchapply.name" class="inp_large" value="$!modifyMatchapplyForm.matchapply.name"/>
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<dt>学校名称：</dt>
			<dd>
				<input type="text" name="matchapply.unitname" class="inp_large" value="$!modifyMatchapplyForm.matchapply.unitname"/>
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<dt>作者姓名：</dt>
			<dd>
				<input type="text" name="matchapply.authors" class="inp_large" value="$!modifyMatchapplyForm.matchapply.authors"/>
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<dt>辅导老师：</dt>
			<dd>
				<input type="text" name="matchapply.teachers" class="inp_large" value="$!modifyMatchapplyForm.matchapply.teachers"/>
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<dt>作品简述：</dt>
			<dd>
				<textarea name="matchapply.description" id="description">$!modifyMatchapplyForm.matchapply.description</textarea>
			</dd>
		</dl>
		<dl>
			<dt> 是否提交：</dt>
			<dd>
				<label><input type="radio" name="matchapply.state" value="1" #if($!modifyMatchapplyForm.matchapply.state==1) checked="checked" #end />立即提交&nbsp;</label>
				<label><input type="radio" name="matchapply.state" value="0" #if($!modifyMatchapplyForm.matchapply.state==0) checked="checked" #end/>暂不提交</label>
			</dd>
		</dl>
		<dl>
			<dt>验证码：</dt>
			<dd>
				<input type="text" name="matchapply.imagecode" class="inp_small" />
				<img src="$link.setAction('/manage/imageCode.do')" align="absmiddle" id="code"  class="vcode" onclick="change_code(this);"/>
				<span style="color: red;">*</span>
			</dd>
		</dl>
		<dl>
			<span class='error'>#errorMarkup()</span>
        </dl>
		<div class="form_b">
			<input type="hidden" name="matchapply.id" value="$!modifyMatchapplyForm.matchapply.id" />
			<input type="submit" class="btn_blue" id="submit" value="保存">		
			<input type="button" class="btn_blue" id="back" value="返 回" onclick="javascript:history.back();" />
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
