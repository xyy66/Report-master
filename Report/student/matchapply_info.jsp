<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
#parse("/home/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script type="text/javascript" src="$link.setRelative('/home/js/jquery-1.7.2.min.js')" ></script>
<link href="$link.setRelative('/home/theme/default/css/css.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="$link.setRelative('/home/js/common.js')"></script>
<style type="text/css">
.h3{padding:5px; background:#C5E3FA; font-size:14px; font-weight:bold;}
.wzzw{padding:10px; line-height:21px;}
.lh{font-size:14px; line-height:28px;}

.file a:link, a:visited {
    text-decoration : none;
    color : #900b09;
    background : transparent; 
    border-bottom:1px solid #900b09;
}
.file a:hover {
    text-decoration : none;
    color: #ff0000;
    background : transparent; 
    border-bottom:1px solid #ff0000;
}
</style>
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
    <h3 class="nybt">
		#if($!matchapply.state==0||$!matchapply.state==1)
		<i><a href="javascript:;" onclick="toConfirm('$link.setAction('removeMatchapply').addQueryData('id',$!matchapply.id)','该操作不可恢复，确实要删除吗？')">删除</a></i>
		<i>&nbsp;|&nbsp;</i>
		<i><a href="$link.setAction('load4MatchapplyModify').addQueryData('id',$!matchapply.id)">修改</a></i>
		#end
		<span>参赛报名信息</span>
	</h3>
    <div class="form">
		<div class="h3">
			<span>参赛报名信息</span>
		</div>
		<dl>
    		<dt>参赛年度：</dt>
    		<dd>$!matchapply.annualmatch</dd>
    	</dl>
    	<dl>
    		<dt> 参赛项目：</dt>
    		<dd>$!matchapply.matchname</dd>
    	</dl>	
    	<dl>
    		<dt>作品名称：</dt>
    		<dd>$!matchapply.name</dd>
    	</dl>
    	<dl>
    		<dt>学校名称：</dt>
    		<dd>$!matchapply.unitname</dd>
    	</dl>
    	<dl>
    		<dt>作者姓名：</dt>
    		<dd>$!matchapply.authors</dd>
    	</dl>
    	<dl>
    		<dt>辅导老师：</dt>
    		<dd>$!matchapply.teachers</dd>
    	</dl>
		<dl>
    		<dt>报名状态：</dt>
    		<dd>
				#if($!matchapply.state==0)
					<span style='color: #0000FF;'>未提交</span> 
				#elseif($!matchapply.state==1)
					<span style='color: #8A2BE2;'>已提交</span>
				#elseif($!matchapply.state==2)
					<span style='color: #00FF00;'>审核通过</span>
				#elseif($!matchapply.state==3)
					<span style='color: #FF0000;'>审核未通过</span>
				#end
			</dd>
    	</dl>
    	<dl>
    		<dt>作品简述：</dt>
    		<dd>
    			<div class="wzzw lh" id="content">
        			$!matchapply.description
        		</div>
    		</dd>
    	</dl>
		<dl>
    		<dt>附件资料：</dt>
    		<dd>
				<p class="file">
                    <a target="_blank" href="$!matchapply.filepath" title="$!matchapply.filename">$!matchapply.filename</a>
                </p>
    		</dd>
    	</dl>
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
