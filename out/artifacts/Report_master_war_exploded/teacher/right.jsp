#set($loginInfo = $session.getAttribute($MANAGE_SESSION))
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link type="text/css" rel="stylesheet" href="$link.setRelative('/manage/css1/style.css')" />
<script type="text/javascript" src="$link.setRelative('/manage/js1/jquery.js')"></script>

</head>
<style type="text/css">
	html{_overflow-y:scroll}
</style>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="$link.setRelative('/manage/images1/sun.png')" alt="天气" /></span>
    <b>$!loginInfo.factname ，您好！欢迎使用中北大学软件学院大学生创新创业大赛 网上申报系统</b>
    </div>

    
    <div class="xline"></div>
	
	<div class="infoleft" style="margin-top: 10px;width: 50%;">
		<div class="listtitle">最新通知</div>    
        <ul class="newlist">
			#set($messageList = $request.getAttribute("messageList"))
			#foreach($message in $messageList)
            <li><a href="$link.setAction('showMessageInfo').addQueryData('id',$!message.id)">$!message.title</a><b>$!message.publishtime</b></li>
			#end
        </ul>   
    </div>
	
	<div class="inforight" style="margin-top: 10px;width: 48%;">
		<div class="listtitle">最新公告</div>    
        <ul class="newlist">
			#set($announceList = $request.getAttribute("announceList"))
			#foreach($announce in $announceList)
            <li><a href="$link.setAction('showAnnounceInfo').addQueryData('id',$!announce.id)">$!announce.title</a><b>$!announce.publishtime</b></li>
			#end
        </ul>   
    </div>
    
    </div>
</body>
</html>