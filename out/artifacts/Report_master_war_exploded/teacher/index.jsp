#set($loginInfo = $session.getAttribute($MANAGE_SESSION))
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
#parse("/manage/include/webtitle.vm")
<link rel="shortcut icon" href="$link.setRelative('favicon.png')" />
<script language="javascript" type="text/javascript" src="$link.setRelative('/manage/js/jquery-1.7.2.min.js')"></script>
<script src="$link.setRelative('/manage/js/frame.js')" language="javascript" type="text/javascript"></script>
<link href="$link.setRelative('/manage/css/frame.css')" rel="stylesheet" type="text/css" />
<link href="$link.setRelative('/manage/css1/style.css')" rel="stylesheet" type="text/css" />
<script type="text/javascript">
jQuery(function(){	
	//导航切换
	jQuery(".menuson li").click(function(){
		jQuery(".menuson li.active").removeClass("active")
		jQuery(this).addClass("active");
	});
	
	jQuery('.title').click(function(){
		var ul = jQuery(this).next('ul');
		jQuery('dd').find('ul').slideUp();
		if(ul.is(':visible')){
			jQuery(this).next('ul').slideUp();
		}else{
			jQuery(this).next('ul').slideDown();
		}
	});
})	
</script>
</head>
<body class="showmenu">
<div class="head" style="background:url($link.setRelative('/manage/images1/topbg.gif')) repeat-x;">
<div class="top_logo topleft"> <img src="$link.setRelative('/manage/images1/logo.png')" /> </div>
	 <div class="top_link">
      <ul>
	    <li id="i_self">您好，$loginInfo.get("username")</li>
		<li id="i_hide_menu"><a href="#" id="togglemenu">隐藏菜单</a></li>
        ##<li id="i_home"><a href="$link.contextPath" target="_blank">首页</a></li> 
		<li id="i_home"><a href="$link.setAction('load4Index')">首页</a></li> 
        <li id="i_exit"><a href="$link.setAction('logout')" target="_top">退出</a></li>		
      </ul>
    </div>
</div>
<!-- header end -->

<div class="left">
	<div class="lefttop"><span></span>系统菜单</div>
    <dl class="leftmenu">
		#set($menuList = $request.getAttribute("menuList"))
		#foreach($menu in $menuList)
        <dd>
            <div class="title">
    			<span><img src="$link.setRelative('/manage/images1/leftico01.png')" /></span>$!menu.name
            </div>
        	<ul class="menuson">
				#set($subMenuList = $menu.subMenuList)
				#foreach($subMenu in $subMenuList)
                <li><cite></cite><a href="$!subMenu.url" target="right">$!subMenu.name</a><i></i></li>
				#end
            </ul>    
        </dd>
		#end
    </dl>

</div>
<!-- left end -->

<div class="right">
	<div class="rightContent">
	<iframe id="right" name="right" frameborder="0" scrolling="yes" src="$link.setAction('load4Right')" ></iframe>
	</div>    
</div>
<!-- right end -->

<div class="bottom">
	#parse("/manage/include/bottom.vm")
</div>
<!-- bottom end -->

</body>
</html>