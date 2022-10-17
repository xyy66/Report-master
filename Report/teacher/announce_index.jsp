<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script type="text/javascript" src="$link.setRelative('/manage/js/common.js')"></script>
</head>
<body>
<div class="main">
	<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="$link.setAction('load4AnnounceIndex')">公告管理</a></li>
        </ul>
    </div>
	<div class="formbody">
		<form method="get" action="$link.setAction('load4AnnounceIndex')">
		<ul class="seachform">
			#set($istrash = $request.getAttribute("istrash"))
			#if($istrash=="1")
				&nbsp;
			#else
			<li>
				<label>公告标题：</label>
				<input type="text" name="announce.title" title="关键字" class="scinput" value="$!queryAnnounceForm.announce.title">
			</li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="scbtn" value="查询"/>
			</li>
			#end
			<li>
				#if($istrash=="1")
        			<input type="button" onclick="goUrl('$link.setAction('load4AnnounceIndex')')"  class="scbtn" value="返回" />
        		#else
        			<input type="button" onclick="goUrl('$link.setAction('load4AnnounceAdd')')" class="scbtn" value="添加公告" />
                    <input type="button" onclick="goUrl('$link.setAction('load4AnnounceIndex').addQueryData('istrash','1')')" class="scbtn" value="回收站" />
        		#end
            </li>
        </ul>
        </form>
    </div>
	<table class="tablelist">
    	<tr>
			<th>编号</th>
            <th width="35%">公告标题</th>
			<th>开始时间</th>
            <th>结束时间</th>
            <th>发布状态</th>
            <th>发布时间</th>
            <th>操作</th>
        </tr>
		<tbody>
		#set($announceList = $request.getAttribute("announceList"))
		#foreach($announce in $announceList)
		<tr>
			<td>$!announce.id</td>
			<td>$!announce.title</td>
			<td>$!announce.starttime</td>
			<td>$!announce.endtime</td>
			<td>
				#if($!announce.isexpire==1)
					<span style='color: red;'>已过期</span>
				#else
					#if($!announce.ispublish==0) 
                    <span style='color: blue;'>未发布</span> 
					#else 
                    <span style='color: green;'>已发布</span> 
					#end
				#end
			</td>
			<td>$!announce.publishtime</td>
			<td>
				<a class="tablelink" href="$link.setAction('load4AnnounceInfo').addQueryData('id',$!announce.id)">查看</a>
			#if($istrash=="1")
				<a class="tablelink" href="javascript:;" onclick="toConfirm('$link.setAction('restoreAnnounce').addQueryData('id',$!announce.id)','确实要还原吗？')">还原</a>
				<a class="tablelink" href="javascript:;" onclick="toConfirm('$link.setAction('removeAnnounce').addQueryData('id',$!announce.id)','该操作不可恢复，确实要删除吗？')">彻底删除</a>
			#else
				<a class="tablelink" href="$link.setAction('load4AnnouncePublish').addQueryData('id',$!announce.id)">发布</a>
				<a class="tablelink" href="$link.setAction('load4AnnounceModify').addQueryData('id',$!announce.id)">编辑</a>
				<a class="tablelink" href="javascript:;" onclick="toConfirm('$link.setAction('trashAnnounce').addQueryData('id',$!announce.id)','确实要删除吗？')">删除</a>
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
