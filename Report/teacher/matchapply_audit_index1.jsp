<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel='stylesheet' type="text/css" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4MatchapplyAuditIndex')">参赛报名审核</a></li>
        </ul>
    </div>
    <div class="formbody">
        <form method="get" action="$link.setAction('load4MatchapplyAuditIndex1')">
		<ul class="seachform">
			<input type="hidden" name="matchapply.memberid" value="$!queryMatchapplyForm.matchapply.memberid">
			<li>
				<label>参赛年度：</label>
				<input type="text" id="annualmatch" name="matchapply.annualmatch" class="scinput" style="width: 60px;" value="$!queryMatchapplyForm.matchapply.annualmatch"/>
			</li>
			<li>
    			<label>参赛项目：</label>
    			<select id="matchid" name="matchapply.matchid" class="dfinput" style="width:120px;">
    				<option value="0">--请选择--</option>
    				#set($matchinfoList = $request.getAttribute("matchinfoList"))
    				#foreach($matchinfo in $matchinfoList)
    					#if($!matchinfo.id==$!queryMatchapplyForm.matchapply.matchid)
    						<option value="$!matchinfo.id" selected="selected">$!matchinfo.name</option>
    					#else
    						<option value="$!matchinfo.id">$!matchinfo.name</option>
    					#end
    				#end
    			</select>
			</li>
        	<li>
				<label>作品名称：</label>
				<input type="text" name="matchapply.name" title="关键字" class="scinput" value="$!queryMatchapplyForm.matchapply.name">
			</li>
			<li>
				<label>审核状态：</label>
				<select name="matchapply.state" class="dfinput" style="width:100px;">
					<option value="9" #if($!queryMatchapplyForm.matchapply.state==9) selected="selected" #end>--请选择--</option>
    				<option value="1" #if($!queryMatchapplyForm.matchapply.state==1) selected="selected" #end>未审核</option>
    				<option value="2" #if($!queryMatchapplyForm.matchapply.state==2) selected="selected" #end>审核通过</option>
    				<option value="3" #if($!queryMatchapplyForm.matchapply.state==3) selected="selected" #end>审核未通过</option>
    			</select>
            </li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="scbtn" value="查询"/>
    			<input type="button" class="scbtn" value="返 回" onclick="goUrl('$link.setAction('load4MatchapplyAuditIndex')')" />
			</li>
		</ul>
        </form>
    </div>
    <table class="tablelist">
        <tr>
			<th>编号</th>
			<th>参赛单位名称</th>
			<th width="35%">作品名称</th>
			<th>学校</th>
			<th>作者</th>
			<th>审核状态</th>
            <th>更新时间</th>
            <th>操作</th>
        </tr>
		<tbody>
		#set($matchapplyList = $request.getAttribute("matchapplyList"))
		#foreach($matchapply in $matchapplyList)
		<tr>
			<td>$!matchapply.id</td>
			<td>$!matchapply.factname</td>
			<td>$!matchapply.name</td>
			<td>$!matchapply.unitname</td>
			<td>$!matchapply.authors</td>
			<td>
				#if($!matchapply.state==1)
					<span style='color: #8A2BE2;'>未审核</span>
				#elseif($!matchapply.state==2)
					<span style='color: #00FF00;'>审核通过</span>
				#elseif($!matchapply.state==3)
					<span style='color: #FF0000;'>审核未通过</span>
				#end
			</td>
			<td>$!matchapply.updatetime</td>
			<td>
				<a class="tablelink" href="$link.setAction('load4MatchapplyAuditInfo').addQueryData('id',$!matchapply.id)">查看</a>
				#if($matchapply.state==1)
				<a class="tablelink" href="$link.setAction('load4MatchapplyAudit').addQueryData('id',$!matchapply.id)">审核</a>
				#end
            </td>
        </tr>
		#end
		</tbody>
    </table>
    <div class="page" style="clear: both;">
		#parse("/home/include/page.vm")
    </div>
	<script type="text/javascript">
    	jQuery('.tablelist tbody tr:odd').addClass('odd');
    </script>
</div>
</body>
</html>
