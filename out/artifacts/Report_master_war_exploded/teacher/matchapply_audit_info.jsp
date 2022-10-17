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
<style type="text/css">
.h3{padding:5px; background:#C5E3FA; font-size:14px; font-weight:bold;border-left: 5px #0099FF solid;}
</style>
</head>
<body>
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4MatchapplyAuditIndex')">参赛报名审核</a></li>
            <li><a href="#">参赛报名信息</a></li>
        </ul>
    </div>
	<div class="formbody">
		<div class="h3">
			<span>参赛报名信息</span>
		</div>
		<ul class="forminfo">
			<li>
				<label>参赛年度：</label>
				<span>$!matchapply.annualmatch</span>
			</li>
			<li>
				<label>参赛项目：</label>
				<span>$!matchapply.matchname</span>
			</li>
			<li>
				<label>作品名称：</label>
				<span>$!matchapply.name</span>
			</li>
			<li>
				<label>学校名称：</label>
				<span>$!matchapply.unitname</span>
			</li>
			<li>
				<label>作者姓名：</label>
				<span>$!matchapply.authors</span>
			</li>
			<li>
				<label>辅导老师：</label>
				<span>$!matchapply.teachers</span>
			</li>
			<li>
				<label>报名状态：</label>
				<span>
					#if($!matchapply.state==0)
    					<span style='color: #3385ff;'>未提交</span> 
    				#elseif($!matchapply.state==1)
    					<span style='color: #8A2BE2;'>已提交</span>
    				#elseif($!matchapply.state==2)
    					<span style='color: #00FF00;'>审核通过</span>
    				#elseif($!matchapply.state==3)
    					<span style='color: #FF0000;'>审核未通过</span>
    				#end
				</span>
			</li>
			<li>
				<label>审核意见：</label>
				<span style="display: flex;"><textarea id="checkmemo" readonly="readonly" class="dfinput" style="width:600px;height:100px;">$!matchapply.checkmemo</textarea></span>
			</li>
			<li>
				<label>作品简述：</label>
				<span style="display: flex;"><textarea id="description" readonly="readonly">$!matchapply.description</textarea></span>
			</li>
			<li>
				<label>附件资料：</label>
				<span style="display: flex;"><a target="_blank" href="$!matchapply.filepath" title="$!matchapply.filename">$!matchapply.filename</a></span>
			</li>
        </ul>
		<div class="h3">
			<span>参赛结果</span>
		</div>
		#if($matchapply.ispublish==1)
		<ul class="forminfo">
			<li>
				<label>比赛得分：</label>
				<span>$!matchapply.score</span>
			</li>
			<li>
				<label>比赛名次：</label>
				<span>$!matchapply.ranking</span>
			</li>
			<li>
				<label>比赛奖项：</label>
				<span>$!matchapply.awards</span>
			</li>
			<li>
				<label>发布状态：</label>
				<span>
    				#if($matchapply.ispublish==0)
    					未发布
    				#elseif($matchapply.ispublish==1)
    					已发布
    				#end
				</span>
			</li>
			<li>
				<label>发布时间：</label>
				<span>$!matchapply.publishtime</span>
			</li>
        </ul>
		#else
		<ul class="forminfo">
			<li>
				<label>未发布参赛结果</label>
			</li>
        </ul>
		#end
		<ul class="forminfo">
			<li>
        		<input type="button" class="btn" id="back" value="返 回" onclick="javascript:history.back();" />
            </li>
        </ul>
	</div>
</div>
<script type="text/javascript">
	var ue = UE.getEditor('description', {
		toolbars: [
            ['fullscreen']
        ],
        initialFrameWidth : 800,
        initialFrameHeight: 400
    });
	ue.ready(function() {
	    ue.setDisabled('fullscreen');
	});
</script>

</body>
</html>