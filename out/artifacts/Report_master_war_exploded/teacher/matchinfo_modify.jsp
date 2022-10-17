<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel='stylesheet' type="text/css" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery.form.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.config.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/ueditor/ueditor.all.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/calendar.config.js')"></script>
<script type="text/javascript">
	
	window.UEDITOR_HOME_URL = "ueditor/";
	window.onload = function() {
		UE.getEditor('description', {
    		toolbars: [
                ['fullscreen', 'source', 'undo', 'redo']
            ],
            initialFrameWidth : 800,
            initialFrameHeight: 100
        });
		
		UE.getEditor('content', {
            initialFrameWidth : 800,
            initialFrameHeight: 400
        });
    }



</script>
<script type="text/javascript">
jQuery(function () {
     jQuery("input[name='matchinfo.annualmatch']").focus();
	 
     jQuery("#form_do").submit(function(){
		var annualmatch = jQuery("input[name='matchinfo.annualmatch']");
		var name = jQuery("input[name='matchinfo.name']");
		var begindate = jQuery("input[name='matchinfo.begindate']");
		var enddate = jQuery("input[name='matchinfo.enddate']");
		var optunitname = jQuery("input[name='matchinfo.optunitname']");
		var description = jQuery("#description");
		var content = jQuery("#content");
		if(jQuery.trim(annualmatch.val())==''){
			annualmatch.parent().find("span").remove().end().append("<span class='errorcolor'>参赛年度不能为空</span>");
			annualmatch.focus();
			return false;			
		}else {
			annualmatch.parent().find("span").remove().end();
		}
		if(jQuery.trim(name.val())==''){
			name.parent().find("span").remove().end().append("<span class='errorcolor'>参赛项目名称不能为空</span>");
			name.focus();
			return false;			
		}else {
			name.parent().find("span").remove().end();
		}
		if(jQuery.trim(begindate.val())==''){
			begindate.parent().find("span").remove().end().append("<span class='errorcolor'>报名开始日期不能为空</span>");
			begindate.focus();
			return false;			
		}else {
			begindate.parent().find("span").remove().end();
		}
		if(jQuery.trim(enddate.val())==''){
			enddate.parent().find("span").remove().end().append("<span class='errorcolor'>报名截止日期不能为空</span>");
			enddate.focus();
			return false;			
		}else {
			enddate.parent().find("span").remove().end();
		}
		if(jQuery.trim(optunitname.val())==''){
			optunitname.parent().find("span").remove().end().append("<span class='errorcolor'>主办单位不能为空</span>");
			optunitname.focus();
			return false;			
		}else {
			optunitname.parent().find("span").remove().end();
		}
		if(!UE.getEditor('description').hasContents()){
			description.parent().find("span").remove().end().append("<span class='errorcolor'>摘要不能为空</span>");
			description.focus();
			return false;			
		}else {
			description.parent().find("span").remove().end();
		}
		if(!UE.getEditor('content').hasContents()){
			content.parent().find("span").remove().end().append("<span class='errorcolor'>内容不能为空</span>");
			content.focus();
			return false;			
		}else {
			content.parent().find("span").remove().end();
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
            <li><a href="$link.setAction('load4MatchinfoIndex')">参赛项目管理</a></li>
            <li><a href="#">修改参赛项目</a></li>
        </ul>
    </div>
	<div class="formbody">
		<form method='post' id="form_do" name="form_do" action="$link.setAction('modifyMatchinfo')">
		<ul class="forminfo">
			<li>
				<label>参赛年度：<b>*</b></label>
				<input type="text" id="annualmatch" name="matchinfo.annualmatch" class="dfinput" style="width:100px;" value="$!modifyMatchinfoForm.matchinfo.annualmatch"/>
			</li>
			<li>
				<label>参赛项目名称：<b>*</b></label>
				<input type="text" name="matchinfo.name" class="dfinput" style="width:600px;" value="$!modifyMatchinfoForm.matchinfo.name"/>
			</li>
			<li>
				<label>参赛类型：<b>*</b></label>
				<select name="matchinfo.matchtype" class="dfinput" style="width:300px;">
					#set($matchtypeList = $request.getAttribute("matchtypeList"))
					#foreach($matchtype in $matchtypeList)
						#if($!matchtype.id==$!modifyMatchinfoForm.matchinfo.matchtype)
							<option value="$!matchtype.id" selected="selected">$!matchtype.name</option>
						#else
							<option value="$!matchtype.id">$!matchtype.name</option>
						#end
					#end
				</select>
			</li>
			<li>
				<label>报名开始日期：<b>*</b></label>
				<input type="text" class="dfinput" style="width:200px;" name="matchinfo.begindate" id="begindate" readonly="readonly" value="$!modifyMatchinfoForm.matchinfo.begindate"/>
                <script type="text/javascript">
                    Calendar.setup({
                        weekNumbers: true,
                        inputField : "begindate",
                        trigger    : "begindate",
                        dateFormat: "%Y-%m-%d",
                        showTime: true,
                        minuteStep: 1,
                        onSelect   : function() {this.hide();}
                    });
                </script>
			</li>
			<li>
				<label>报名截止日期：<b>*</b></label>
				<input type="text" class="dfinput" style="width:200px;" name="matchinfo.enddate" id="enddate" readonly="readonly" value="$!modifyMatchinfoForm.matchinfo.enddate"/>
                <script type="text/javascript">
                    Calendar.setup({
                        weekNumbers: true,
                        inputField : "enddate",
                        trigger    : "enddate",
                        dateFormat: "%Y-%m-%d",
                        showTime: true,
                        minuteStep: 1,
                        onSelect   : function() {this.hide();}
                    });
                </script>
			</li>
			<li>
				<label>主办单位：<b>*</b></label>
				<input type="text" name="matchinfo.optunitname" class="dfinput" style="width:600px;" value="$!modifyMatchinfoForm.matchinfo.optunitname"/>
			</li>
			<li>
				<label>参赛简述：</label>
				<label style="margin-bottom: 13px;"><textarea name="matchinfo.description" id="description">$!modifyMatchinfoForm.matchinfo.description</textarea></label>
			</li>
			<li>
				<label>参赛详细说明：</label>
				<label style="margin-bottom: 13px;"><textarea name="matchinfo.content" id="content">$!modifyMatchinfoForm.matchinfo.content</textarea></label>
			</li>
			<li>
				<span class='errorcolor'>#errorMarkup()</span>
            </li>
			<li>
				<label>&nbsp;</label>
				<input type="hidden" name="matchinfo.id" value="$!modifyMatchinfoForm.matchinfo.id" />
				<input name="" type="submit" class="btn" value="保存"/>
				<input type="button" class="btn" id="back" value="返 回" onclick="javascript:history.back();" />
			</li>
        </ul>
	   </form>
	</div>
</div>


</body>
</html>