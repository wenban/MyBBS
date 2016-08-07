<%@page import="com.wenban.bbs.model.Topic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String serverPath = "http://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<%
	Topic topic = (Topic) request.getAttribute("oneTopic");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柚子皮</title>

<meta http-equiv="Cache-Control" content="no-transform ">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=no">
<meta name="description"
	content="今天公司开会谈及招聘文案这件事，这事可是四年前我提出来，到现在老板总是说招，还是决心没到，到现在都是桌上谈兵。有点遗憾，百度每个月十几万的广告费都不在乎，还在乎几千块的文案（真正牛B的文案3W也招不到）…">
<meta name="keywords" content="文案招聘, 文案策划">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" id="sytle-css"
	href="<%=serverPath%>/css/style.css" type="text/css" media="all">
<link rel="stylesheet" id="yzipi-pc-css"
	href="<%=serverPath%>/css/yzipi-pc.css" type="text/css" media="all">
<link rel="stylesheet" id="yzipi-ipad-css"
	href="<%=serverPath%>/css/yzipi-ipad.css" type="text/css" media="all">
<link rel="stylesheet" id="yzipi-phone2-css"
	href="<%=serverPath%>/css/yzipi-phone2.css" type="text/css" media="all">
<link rel="stylesheet" id="yzipi-phone-css"
	href="<%=serverPath%>/css/yzipi-phone.css" type="text/css" media="all">
<script type="text/javascript" src="<%=serverPath%>/js/html5shiv.js"></script>
<script type="text/javascript"
	src="<%=serverPath%>/js/css3-mediaqueries.js"></script>
<script type="text/javascript"
	src="<%=serverPath%>/js/selectivizr-min.js"></script>
<script type="text/javascript" src="<%=serverPath%>/js/jquery.1.11.1.js"></script>
<script src="<%=serverPath%>/js/jsrender.min.js" type="text/javascript"
	charset="utf-8"></script>
<script id="commentrender" type="text/x-jsrender">
<ol id="comment">
<li id="comment-13248">
	<span> 
		<a href="" class="avatar" target="_blank"> 
		<img src="pic/3899684c3b7646a279fd4ccf0b00166f.jpeg" 
			class="avatar avatar-86" height="86" width="86">
		</a>
	</span>
	<div class="mhcc">
		<address>
			<font color="">{{:topicId}}</font> - 2016.04.18
		</address>
		<p>{{:descs}}</p>
	</div>
</li>
</ol>
</script>

<script type="text/javascript">
	$(function() {

		$("#submitbutton").click(			
				function() {
					alert("a");
					var mycomment;
					$.ajax({
						url :'<%=serverPath%>/reply',
						type : "post",
						data : {
							"descs" : $("#descs").val(),
							"topicId" : $("#topicId").val(),
						},
						success : function(data) {
							var a=$.templates("#commentrender").render(data);
							alert("1");
							alert(a);
							$("#comments").prepend(a);
						},
						error : function() {
							alert("0");
						}
					});
				});

	});
</script>
</head>

<body>
	<header id="header-web">
	<div class="header-main">
		<span><a href="gotologin">[登录]</a>
		<a href="gotoregister">[注册]</a>
		<a href="logout">[退出]</a>
		</span>
		<hgroup class="logo">
		<h1>
			<a href="category" title="柚子皮"><img src="imag/logo.png" alt="柚子皮"></a>
		</h1>
		</hgroup>
		<!--logo-->
		<nav class="header-nav">
		<ul id="menu-nav" class="menu">
			<li id="menu-item-31" class="menu-item menu-item-type-taxonomy menu-item-object-category">
				<a id="firstcategory" title="发帖" href="add">发帖</a>
			</li>
			<c:forEach items="${categoryList}" var="category">
				<li id="menu-item-31" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-31">
				<a id="firstcategory" title="分类" href="selectTopic?Id=${category.id}">${category.cateName}</a>
					<ul class="sub-menu">
						<c:forEach items="${category.subCateName}" var="cate">
							<li id="menu-item-3218" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-3218">
								<a>${cate.cateName}</a>
							</li>
						</c:forEach>
					</ul>
			    </li>
			</c:forEach>
		</ul>
		</li>
		</ul>
		</nav>
		<!--header-nav-->
		<!--header-main-->
	</div>
	</header>
	<!--header-web-->
	<div id="main">
		<div id="soutab">
			<form method="get" class="search" action="http://www.yzipi.com/">
				<input class="text" type="text" name="s" placeholder=" 请输入关键词" value=""> 
				<input class="butto" value="" type="submit">
			</form>
		</div>
		<div id="container">
			<nav id="mbx"> 当前位置： <a href="http://www.yzipi.com/">首页</a>
			&gt; <a href="http://www.yzipi.com/category/youshuo">柚说</a> &gt; 正文 </nav>
			<!--mbx-->
			<article class="content"> 
			<header class="contenttitle">
			<a href="http://www.yzipi.com/3580.htm#comments" class="counte">${onetopic.id}</a>
			<div class="mscc">
				<h1 class="mscctitle">
					<a href="http://www.yzipi.com/3580.htm">${onetopic.name}</a>
				</h1>
				<address class="msccaddress ">
					<em>已有 3,259 人阅读此文 -</em> 
					楼主：<span>${onetopic.userName}</span>
					<a href="delete?deleteid=${onetopic.id}">删除</a>
					<time>${onetopic.createTime}</time>
				</address>
			</div>
			</header>
			<div class="content-text">
				<p>${onetopic.summary}</p>
				<blockquote>
					<p>
						<strong><span style="color: #ff6600;">${onetopic.name}</span></strong>
					</p>
					<p>${onetopic.descs}</p>
				</blockquote>
			</div>
			<!--content_text-->
			<div class="post-like">
				<a href="javascript:;" data-action="ding" data-id="3580"
					class="favorite"> <span class="count">57</span>
				</a>
			</div>
			</article>
			<!--content-->

			<div class="comment" id="comments">
				<!-- You can start editing here. -->
				<ol id="comment">
					<li id="comment-13248"><span> <a href="" class="avatar"
							target="_blank"> <img
								src="pic/3899684c3b7646a279fd4ccf0b00166f.jpeg"
								class="avatar avatar-86" height="86" width="86"></a>
					</span>
						<div class="mhcc">
							<address>
								<font color="">匿名</font> - 2016.04.18
							</address>
							<p>default</p>

						</div></li>
					<!-- #comment-## -->
				</ol>
				<div id="respond">
					<form action="" method="post" id="commentform">
						<input id="topicId" type="hidden" name="topicId"
							value="${onetopic.id}" />
						<textarea name="descs" id="descs" rows="3" tabindex="5"
							placeholder="你有什么要说的 ..."></textarea>
						<input name="submitbutton" type="button" id="submitbutton"
							tabindex="2" value="提交评论">
					</form>
				</div>
			</div>
			<!-- .nav-single -->
		</div>
		<!--Container End-->
		<aside id="sitebar"> <!--erweima-->
		<div class="sitebar_list">
			<div class="wptag">
				<span class="tagtitle">热门标签 ...</span>
				<div class="tagg">
					<ul id="menu-tag" class="menu">
						<li id="menu-item-2882"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2882">
							<a href="http://www.yzipi.com/tag/%e6%89%a7%e8%a1%8c%e5%8a%9b">执行力</a>
						</li>
						<li id="menu-item-2711"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2711">
							<a href="http://www.yzipi.com/tag/o2o">O2O</a>
						</li>
						<li id="menu-item-2709"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2709">
							<a
							href="http://www.yzipi.com/tag/%e7%b2%89%e4%b8%9d%e7%bb%8f%e6%b5%8e">粉丝经济</a>
						</li>
						<li id="menu-item-2707"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2707">
							<a
							href="http://www.yzipi.com/tag/%e4%ba%92%e8%81%94%e7%bd%91%e6%80%9d%e7%bb%b4">互联网思维</a>
						</li>
						<li id="menu-item-1323"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1323">
							<a href="http://www.yzipi.com/category/marketing/psychology">营销心理学</a>
						</li>
						<li id="menu-item-2881"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2881">
							<a href="http://www.yzipi.com/tag/%e5%86%b7%e5%90%af%e5%8a%a8">冷启动</a>
						</li>
						<li id="menu-item-2712"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2712">
							<a href="http://www.yzipi.com/tag/%e9%a9%ac%e4%ba%91">马云</a>
						</li>
						<li id="menu-item-2883"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2883">
							<a
							href="http://www.yzipi.com/tag/%e4%ba%ba%e6%80%a7%e5%bc%b1%e7%82%b9">人性弱点</a>
						</li>
						<li id="menu-item-2842"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2842">
							<a href="http://www.yzipi.com/?s=%E5%BE%AE%E4%BF%A1">微信</a>
						</li>
						<li id="menu-item-2841"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2841">
							<a href="http://www.yzipi.com/?s=%E4%BA%92%E8%81%94%E7%BD%91%2B">互联网
								+</a>
						</li>
						<li id="menu-item-2708"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2708">
							<a href="http://www.yzipi.com/tag/%e5%91%a8%e9%b8%bf%e7%a5%8e">周鸿祎</a>
						</li>
						<li id="menu-item-2715"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2715">
							<a href="http://www.yzipi.com/tag/%e5%a4%a7%e6%95%b0%e6%8d%ae">大数据</a>
						</li>
						<li id="menu-item-3224"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3224">
							<a href="http://www.yzipi.com/tag/%e5%b7%ae%e5%bc%82%e5%8c%96">差异化</a>
						</li>
						<li id="menu-item-3225"
							class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3225">
							<a href="http://www.yzipi.com/tag/%e5%ae%9a%e4%bd%8d">定位</a>
						</li>
						<li id="menu-item-3227"
							class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-3227">
							<a href="http://www.yzipi.com/category/experience/duanzi">柚段子</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sitebar_list">
			<h4 class="sitebar_title">栏目随机</h4>
			<ul class="sitebar_list_ul">
				<li><a href="http://www.yzipi.com/1901.htm" target="_blank">【有逼格】领会到这样设计思想，你就牛逼啦</a>
				</li>
				<li><a href="http://www.yzipi.com/3580.htm" target="_blank">大四男生热恋饭堂阿姨，曾誓言非她不娶</a>
				</li>
				<li><a href="http://www.yzipi.com/3459.htm" target="_blank">不讲人性而讲用户体现的，都是在装B</a>
				</li>
				<li><a href="http://www.yzipi.com/3268.htm" target="_blank">如何圈着网站用户，柚子皮成立一年精度总结</a>
				</li>
				<li><a href="http://www.yzipi.com/3473.htm" target="_blank">你的产品或服务能帮助用户（高效）解决问题吗？</a>
				</li>
				<li><a href="http://www.yzipi.com/3339.htm" target="_blank">在运营一个项目之前，你得考虑清楚这三点</a>
				</li>
			</ul>
		</div>
		<a href="http://www.yzipi.com/yunyin" class="yund" target="_blank">
			<img src="images/yund.png">
		</a> </aside>
		<div class="clear"></div>
	</div>
	<!--main-->
	<footer id="dibu">
	<div class="about">
		<div class="right">
			<ul id="menu-bottom-nav" class="menu">
				<li id="menu-item-69"
					class="menu-item menu-item-type-post_type menu-item-object-page menu-item-69">
					<a href="http://www.yzipi.com/about">关于我们</a>
				</li>
				<li id="menu-item-3013"
					class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3013">
					<a href="http://www.yzipi.com/contaxt">联系我们</a>
				</li>
				<li id="menu-item-1953"
					class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1953">
					<a href="http://www.yzipi.com/link">友情连接</a>
				</li>
				<li id="menu-item-1758"
					class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1758">
					<a href="http://www.yzipi.com/juanz">打赏柚皮</a>
				</li>
			</ul>
			<p class="banquan">柚子皮 ， 互联网的运营笔记！</p>
		</div>
		<div class="left">
			<div class="bottomlist">
				<div class="xinlan">
					<a href="http://weibo.com/234836886" target="_blank"> <img
						src="images/xinlan.png" alt="柚子皮新浪微博" title="柚子皮新浪微博"></a>
				</div>
				<div class="weixin2">
					<div class="weixin">
						<img src="images/weixin.png" alt="柚子皮微信公众号" title="柚子皮微信公众号">
						<img src="images/yzipi6.png" class="xixii" alt="柚子皮微信公众号">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--about-->
	<div class="bottom">
		<a href="http://www.yzipi.com/">柚子皮</a> / <a
			href="http://www.yzipi.com/yzipi4" target="_blank">Yzipi5.63</a> / <a
			href="http://www.yzipi.com/tagcloud" target="_blank">标签</a> / <a
			href="http://www.yzipi.com/guidan" target="_blank">归档</a> / <a
			href="http://www.miitbeian.gov.cn/" rel="external nofollow"
			target="_blank">粤ICP备13063893号-6</a>
	</div>
	<div class="tongji">
		<span id="cnzz_stat_icon_1253468941"> <a
			href="http://www.cnzz.com/stat/website.php?web_id=1253468941"
			target="_blank" title="站长统计">站长统计</a>
		</span>
	</div>
	<!--bottom-->
	<div class="scroll" id="scroll" style="display: none;">︿</div>
	<script type="text/javascript">
		$(function() {
			showScroll();

			function showScroll() {
				$(window).scroll(
						function() {
							var scrollValue = $(window).scrollTop();
							scrollValue > 500 ? $('div[class=scroll]').fadeIn()
									: $('div[class=scroll]').fadeOut();
						});
				$('#scroll').click(function() {
					$("html,body").animate({
						scrollTop : 0
					}, 200);
				});
			}
		})
	</script> </footer>
	<!--dibu-->
</body>

</html>