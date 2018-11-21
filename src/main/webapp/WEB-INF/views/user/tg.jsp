<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basepath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>报名页面</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	font-size: .14rem;
	font-family: "FangSong", "Microsoft YaHei", "Helvetica Neue",
		"Hiragino Sans GB", Arial, sans-serif;
}

html, body {
	height: 100%;
}

input, button, select {
	outline: none;
}

.container {
	max-width: 750px;
	min-height: 100%;
	margin: 0 auto;
	background: no-repeat center 0;
	background-size: cover;
}

.flex-box {
	display: flex;
}

.flex1 {
	flex: 1;
}

.logo {
	padding: .15rem .15rem;
	font-size: .16rem;
}

.logo>img {
	display: inline-block;
	height: .35rem;
}

.logo>img:first-child {
	margin-right: .1rem;
	float: right;
}

.input-wrap {
	width: 2.5rem;
}

.input-wrap>input, .input-wrap>select {
	margin-right: .1rem;
	box-sizing: border-box;
	width: 2rem;
	height: 0.3125rem;
	padding: .04rem 1rem;
	padding: .06rem 8px;
	line-height: 0.2025rem;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #000;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.input-wrap>span {
	vertical-align: baseline;
	display: inline-block;
}

.input-wrap>span>img {
	width: .12rem;
}

.input-wrap>select {
	margin-right: .035rem
}

.input-wrap>input:focus, .input-wrap>select:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
}

.form-wrap>.flex-box {
	padding: .04rem 0;
}

.form-wrap>.flex-box>.flex1 {
	text-align: right;
	padding-right: .1rem;
	box-sizing: border-box;
	font-size: .16rem;
	color: #fff;
}

.beizhu {
	padding: .1rem .2rem;
	text-align: center;
}

.beizhu>div {
	display: inline-block;
	text-align: justify;
	background: #333;
	background: rgba(0, 0, 0, 0.64);
	padding: .1rem;
}

.beizhu p.name {
	color: #fff;
	font-size: .15rem;
}

.beizhu p.info {
	line-height: .24rem;
	font-size: .14rem;
	color: #fff;
}

.beizhu p.info font {
	color: #f00;
}

.btn-wrap {
	text-align: center;
}

.btn-info {
	background: url(${basepath}/static/img/1119/btn_03.png) no-repeat center
		center;
	background-size: 100% 100%;
	border: none;
	width: 1.75rem;
	height: 0.7rem;
	line-height: .22rem;
	font-size: .18rem;
	font-weight: bold;;
	color: #fff;
}

.btn-info:active {
	opacity: .8;
}

.btn {
	text-shadow: 0 2px 2px #000;
	-webkit-text-shadow: 0 2px 2px #000;
	display: inline-block;
	margin-bottom: 0;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border-radius: 4px;
}

.hide {
	display: none !important;
}

.block {
	display: block;
}

.img-block {
	display: block;
	width: 100%;
}

.abs-wrap {
	position: relative;
}

.abs-wrap>div, .abs {
	position: absolute;
}
</style>
</head>

<body>
	<div class="container" style="">
		<div id="first" class="">
			<div
				style="background: url(${basepath}/static/img/1119/bg-re_02.jpg) repeat-y;background-size: 100% auto;padding-bottom: .2rem;position: relative;">
				<img src="${basepath}/static/img/1119/hryx-bg_01.jpg" alt=""
					class="img-block" />
				<form class="form-wrap"
					style="position: absolute; top: 1.7rem; left: 0; width: 100%;" id="addUser" action="${basepath}/fordexhibition/addExhibitionUser.act" method="post">
					<div class="flex-box">
						<div class="flex1">您的姓名：</div>
						<div class="input-wrap">
							<input type="text" id="username" value="${name}" name="name" placeholder="请输入姓名" /><span><img
								src="${basepath}/static/img/abd_18.png" /></span><span id="vusername"
								style="display: none;"><font color="red">请输入姓名！</font></span>
						</div>
					</div>
					<div class="flex-box">
						<div class="flex1">手机号码：</div>
						<div class="input-wrap">
							<input type="text" id="phone" value="${phone}" name="phone" maxlength="11" placeholder="请输入手机号码" /><span><img
								src="${basepath}/static/img/abd_18.png" /></span>
							<c:choose>
								<c:when test="${chongfuerror == 1}">
									<span id="vphone"><font color="red">该号码已使用!</font></span>
								</c:when>
								<c:otherwise>
									<span id="vphone" style="display: none;"><font
										color="red">请输入手机号码！</font></span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="flex-box">
						<div class="flex1">城市：</div>
						<div class="input-wrap">
							<select name="city" id="city">
								<option value="">请选择城市</option>
							</select> <span><img src="${basepath}/static/img/abd_18.png" /></span><span id="vcity" style="display:none;"><font color="red">请选择城市！</font></span>
						</div>
					</div>
					<div class="flex-box">
						<div class="flex1">意向经销商：</div>
						<div class="input-wrap">
							<select name="code" id="code">
								<option value="">请选经销商</option>
							</select> <span><img src="${basepath}/static/img/abd_18.png" /></span><span id="vagentcode" style="display:none;"><font color="red">请选择供应商！</font></span>
						</div>
					</div>
					<div class="flex-box">
						<div class="flex1">时间：</div>
						<div class="input-wrap">
							<select name="supplier" id="supplier">
								<option value="">请选时间</option>
							</select> <span><img src="${basepath}/static/img/abd_18.png" /></span><span id="vselecttime" style="display:none;"><font color="red">请选择时间！</font></span>
						</div>
					</div>
				</form>
			</div>
			<div style="position: relative;">
				<img src="${basepath}/static/img/1119/bg_02.jpg" alt=""
					class="img-block" />
				<div style="position: absolute; top: .2rem; left: 0; width: 100%;">
					<div class="btn-wrap">
						<button class="btn btn-info"
							onclick="validateForm();">
							提交报名信息<br />参与抽奖
						</button>
					</div>
					<div class="beizhu">
						<div>
							<p class="name">备注：</p>
							<p class="info">
								A、“<font>*</font>”处为必填项，请如实填写。 <br /> B、成功报名后才可获得有效抽奖资格。 <br />
								C、报名截止时间：2018年11月30日12时
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="second" style="display: none">
			<div
				style="background: url(${basepath}/static/img/1119/bg-re_02.jpg) repeat-y;background-size: 100% auto;padding-bottom: .2rem;position: relative;">
				<img src="${basepath}/static/img/1119/hryx-bg_01.jpg" alt=""
					class="img-block" />
				<div class="beizhu"
					style="position: absolute; top: 1.9rem; left: 0; right: 0; padding: .1rem .38rem;">
					<div
						style="background: #0e394f; background: linear-gradient(to right, #0e394f, #164f63); background: -webkit-linear-gradient(left, #0e394f, #164f63); width: 100%; box-sizing: border-box; padding: .08rem .1rem;">
						<p class="info"
							style="font-size: .24rem; line-height: 0.26rem; letter-spacing: .02rem; font-weight: 500;">
							您的报名信息将会提交至长安福特授权经销商，由工作人员与您进一步沟通参与活动事宜，若同意请点击下方按钮。</p>
					</div>
				</div>
			</div>
			<div style="position: relative;">
				<img src="${basepath}/static/img/1119/bg_02.jpg" alt=""
					class="img-block" />
				<div style="position: absolute; top: .2rem; left: 0; width: 100%;">
					<div class="btn-wrap">
						<button class="btn btn-info" id="tj"
							onclick="addForm();">
							同意以上告知<br />参与抽奖
						</button>
					</div>
				</div>
			</div>
		</div>
		<audio style="display: block !important; " id="bg-music"
			preload="auto" src="${basepath}/static/music/h5a.mp3" loop="loop"></audio>
	</div>
	<script src="${basepath}/static/js/jquery-1.9.1.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	autoPlayMusic();
	
		(function() {
			var setFont = function() {
				var wd = window.innerWidth > screen.width ? screen.width : window.innerWidth;
				var width = wd > 750 ? 750 : wd;
				var fts = width / 3.75;//23.438
				console.log("fts=" + fts)
				var agent = navigator.userAgent;
				document.documentElement.style.fontSize = fts + 'px'
			}
			setFont();
			//	var window_width = window.innerWidth, calc_window_width;
			//	calc_window_width = window_width>750?750: window_width;
			//	document.documentElement.style.fontSize = calc_window_width/3.75 + 'px'
			window.onresize = function() {
				setFont();
			}

		})()
		$(function() {
			var city = $("select[name=city]"), 
			goalMech = $("select[name=code]"),
			time = $("select[name=supplier]"),
			shopJson=[], timeJson=[];
			city.html('<option value="">请选择城市</option>');
			for(var i=0;i<json.length;i++){
				city.append('<option value="'+json[i].id+'">'+json[i].name+'</option>');
			}
			city.change(function () {
				var obj = getVal('id', json, $(this).val());
				goalMech.html('<option value="">请选经销商</option>');
				time.html('<option value="">请选择时间</option>');
				if(obj){
					shopJson=obj.shop;
					for(var i=0;i<shopJson.length;i++){
						goalMech.append('<option value="'+shopJson[i].shopName+'">'+shopJson[i].shopName+'</option>');
					}
//						var obj2 = getVal('shopId', shopJson, $(this).val());
					if(obj){
						timeJson=obj.time;
						for(var i=0;i<timeJson.length;i++){
							time.append('<option value="'+timeJson[i]+'">'+timeJson[i]+'</option>');
						}
					}
				}
			});
			function getVal(key, list, val) {
				for (var i = 0; i < list.length; i++) {
					if (list[i][key] == val) {
						return list[i];
					}
				}
				return -1;
			}
		});
		var json = [

				{
					"id" : "镇江",
					"name" : "镇江",
					"shop" : [ {
						"shopId" : "A07173",
						"shopName" : "镇江福联"

					} ],
					"time" : [ "2018年12月1日" ]
				},
				{
					"id" : "上海",
					"name" : "上海",
					"shop" : [ {
						"shopId" : "A15397",
						"shopName" : "上海协通"
					} ],
					"time" : [ "2018年12月8日" ]
				},
				{
					"id" : "杭州",
					"name" : "杭州",
					"shop" : [ {
						"shopId" : "A02113",
						"shopName" : "浙江万国"
					} ],
					"time" : [ "2018年12月15日" ]
				},
				{
					"id" : "合肥",
					"name" : "合肥",
					"shop" : [ {
						"shopId" : "A04512",
						"shopName" : "安徽大步"
					} ],
					"time" : [ "2018年12月8日" ]
				},
				{
					"id" : "郑州",
					"name" : "郑州",
					"shop" : [ {
						"shopId" : "A33079",
						"shopName" : "河南吉福"
					} ],
					"time" : [ "2018年12月15日" ]
				},
				{
					"id" : "濮阳",
					"name" : "濮阳",
					"shop" : [ {
						"shopId" : "A09498",
						"shopName" : "濮阳福华"
					} ],
					"time" : [ "2018年12月22日" ]
				},
				{
					"id" : "兰州",
					"name" : "兰州",
					"shop" : [  {
						"shopId" : "A03890",
						"shopName" : "兰州赛福"
					}, {
						"shopId" : "A18235",
						"shopName" : "兰州金岛长福"
					} ],
					"time" : [ "2018年12月8日" ]
				},
				{
					"id" : "湘潭",
					"name" : "湘潭",
					"shop" : [ {
						"shopId" : "A16935",
						"shopName" : "湖南湘潭腾飞"
					} ],
					"time" : [ "2018年12月7日", "2018年12月8日", "2018年12月9日",
							"2018年12月10日", "2018年12月11日", "2018年12月12日",
							"2018年12月13日" ]
				},
				{
					"id" : "深圳",
					"name" : "深圳",
					"shop" : [ {
						"shopId" : "A40027",
						"shopName" : "深圳福嘉"
					}, {
						"shopId" : "A34082",
						"shopName" : "深圳标深"
					} ],
					"time" : [ "2018年12月11日", "2018年12月11日", "2018年12月13日",
							"2018年12月14日", "2018年12月15日", "2018年12月16日",
							"2018年12月17日" ]
				}, {
					"id" : "邢台",
					"name" : "邢台",
					"shop" : [ {
						"shopId" : "A06253",
						"shopName" : "邢台盛源"
					}, {
						"shopId" : "A30295",
						"shopName" : "邢台沧龙"
					}, {
						"shopId" : "A37006",
						"shopName" : "邢台豪驰"
					} ],
					"time" : [ "2018年12月15日" ]
				}, {
					"id" : "临沂",
					"name" : "临沂",
					"shop" : [ {
						"shopId" : "A17157",
						"shopName" : "临沂福悦"
					}, {
						"shopId" : "A05055",
						"shopName" : "临沂福华"
					}, {
						"shopId" : "A33699",
						"shopName" : "临沂御骏"
					} ],
					"time" : [ "2018年12月22日" ]
				}, {
					"id" : "呼和浩特",
					"name" : "呼和浩特",
					"shop" : [ {
						"shopId" : "A04533",
						"shopName" : "内蒙古利丰泰迪"
					} ],
					"time" : [ "2018年12月8日" ]
				},{
					"id" : "金华",
					"name" : "金华",
					"shop" : [ {
						"shopId" : "A04533",
						"shopName" : "金华福达"
					} ],
					"time" : [ "2018年12月22日" ]
				},{
					"id" : "武汉",
					"name" : "武汉",
					"shop" : [ {
						"shopId" : "A04533",
						"shopName" : "黄浦威汉"
					} ],
					"time" : [ "2018年12月29日" ]
				},{
					"id" : "嘉峪关",
					"name" : "嘉峪关",
					"shop" : [ {
						"shopId" : "A04533",
						"shopName" : "嘉峪关良志"
					} ],
					"time" : [ "2018年12月8日" ]
				}
				

		];
		
		function validateForm(){
			var flag  = true;
			var username = $("#username").val();
			var phone = $("#phone").val();
			var agentcode = $("#code").val();
			var vcity = $("#city").val();
			var vselecttime =  $("#supplier").val();
			$("#vusername").hide();
			$("#vphone").hide();
			$("#vagentcode").hide();
			$("#vselecttime").hide();
			$("#vcity").hide();
			if(username==""){
				$("#vusername").show();
				flag = false;
			}
			if(phone==""){
				$("#vphone").html("<font color='red'>请输入电话号码!</font>");
				$("#vphone").show();
				flag = false;
			}else if(phone.length <11){
				$("#vphone").html("<font color='red'>请输入完整电话号码！</font>");
				$("#vphone").show();
				flag = false;
			}
			if(agentcode==""){
				$("#vcity").html("<font color='red'>请选择经销商！</font>");
				$("#vcity").show();
			//	$("#vagentcode").show();
				flag = false;
			}
			if(vcity==""){
				$("#vcity").show();
				flag = false;
			}
			if(vselecttime==""){
				$("#vcity").html("<font color='red'>请选择时间！</font>");
				$("#vcity").show();
			//	$("#vselecttime").show();
				flag = false;
			}
			if(flag==true){
				$('#first').hide();
				$('#second').show();
			}
		}
		
		function addForm(){
			$('#tj').attr("disabled",true);
			var form = document.getElementById("addUser");
			form.submit();
		}
		
		function autoPlayMusic() {
		    // 自动播放音乐效果，解决浏览器或者APP自动播放问题
		    function musicInBrowserHandler() {
		        musicPlay(true);
		        document.body.removeEventListener('touchstart', musicInBrowserHandler);
		    }
		    document.body.addEventListener('touchstart', musicInBrowserHandler);

		    // 自动播放音乐效果，解决微信自动播放问题
		    function musicInWeixinHandler() {
		        musicPlay(true);
		        document.addEventListener("WeixinJSBridgeReady", function () {
		            musicPlay(true);
		        }, false);
		        document.removeEventListener('DOMContentLoaded', musicInWeixinHandler);
		    }
		    document.addEventListener('DOMContentLoaded', musicInWeixinHandler);
		}
		function musicPlay(isPlay) {
		    var media = document.querySelector('#bg-music');
		    if (isPlay && media.paused) {
		        media.play();
		    }
		    if (!isPlay && !media.paused) {
		        media.pause();
		    }
		}
	</script>
</body>

</html>