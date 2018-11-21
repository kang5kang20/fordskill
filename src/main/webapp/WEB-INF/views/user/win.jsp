<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basepath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="path" value="${request.getRequestURL() }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>抽奖页面</title>
	<style type="text/css">
	*{padding: 0;margin: 0;font-size: .14rem;font-family: "Microsoft YaHei","Helvetica Neue","Hiragino Sans GB",Arial,sans-serif;}
	html,body{height: 100%;}
	input,button,select{outline: none;}
	.container{min-height: 100%;max-width: 750px;margin: 0 auto;background: no-repeat center 0;background-size: 100% 100%;}
	.flex-box{display: flex;}
	.flex1{flex: 1;}
	.logo{padding: .15rem .15rem;font-size: .16rem;}
	.logo>img{display: inline-block;height: .35rem;}
	.logo>img:first-child{margin-right: .1rem;float: right;}
	.beizhu{padding: .25rem;text-align: center;}
	.beizhu>div{display: inline-block;text-align: justify;}
	.beizhu p.name{color: #f00;font-size: .15rem;}
	.beizhu p.info{line-height: .22rem;font-size: .13rem;color: #fff;}
	.result-wrap>.ok{padding: .1rem 0;color: #f00;font-size: .2rem;text-align: center;font-weight: bold;}
	#bg2{width:3rem;height:195px;margin:0 auto;}
	#gua1, .gua1{width:2.4rem;margin:0 auto;position: relative;height: 1.2rem;border: .1rem solid #fff;background: #c1c1bf;}
	#di{width:3rem;margin:0 auto;}
	#bg1{display:none;position:fixed;top:0%;left:0%;width:100%;height:100%;background-color:black;z-index:1001;-moz-opacity:0.7;opacity:.70;filter:alpha(opacity=70);}
	#show{display:none;position:absolute;top:222px;left:50%;margin-left:-148px;text-align:center;background-color:#fff;z-index:1002;overflow:auto;}
	#show div{margin-top:-145px;margin-left:40px;padding-right:40px;line-height:1.5;color:#000000;font-size:17px;font-family:'黑体';}
	.zjiang{border: none;padding: .1rem;background-image: url(${basepath}/static/img/zjiang_03.png);background-size: 100% 100%;text-align: center;    display: flex;
	    justify-content: center;	
	    align-items: center;}
	.zjiang>span{font-size: .24rem;color: #f00;text-shadow: 0 0 1px rgba(31, 27, 27, 0.65);}
	.home-btn{background: #fff;color: #f00;font-size: 0.260rem;display: inline-block;text-decoration: none;width: 1.416rem;height: 0.489rem;line-height: 0.489rem;border-radius: .1rem;font-family: "宋体";font-weight: bold;}
	</style>
</head>

<body>
	<div class="container" style="background-image: url(${basepath}/static/img/P3.jpg);">
		<div class="logo"><img src="${basepath}/static/img/abd_05.png" /><img src="${basepath}/static/img/abd_03.png"/></div>
		<div><img src="${basepath}/static/img/abd_10.png" style="width: 2.87rem;margin: .108rem auto 0;display: block;"/></div>
		<!-- 刮奖 -->
		<div class="temp">
			<div><img src="${basepath}/static/img/btd_02.png" style="width: 100%;margin: .308rem auto .23125rem;display: block;"/></div>
			<div>
				<div class="result-wrap">
					<div id="bg1"></div>
					<div id="gua1" >
						<canvas id="front" style="background: no-repeat center center;background-size: cover;" />
					</div>
				</div>
				<div class="beizhu">
					<div>
						<p class="name">备注：</p>
						<p class="info">
							A、每位用户限参与一次抽奖。</br>
							B、奖品领取方式：1、中奖用户可到各活动现场意向经销商处，凭报名时填写的信息（姓名、电话），由现场工作人员核实后方可领取。2、中奖用户如未到现场，则视为自动放弃。</br>
							C、更多活动详情咨询活动经销商。</br>
							D、成功报名后才可获得有效抽奖资格，以报名名单为准，活动报名截止时间：2018年7月12日24时。</br>
							E、长安福特保留对本活动的最终解释权。
						</p>
					</div>
				</div>
			</div>
		</div>	
		<!-- 中奖 -->
		<div class="temp" style="display: none;">
			<div><img src="${basepath}/static/img/btd_02.png" style="width: 100%;margin: .308rem auto .23125rem;display: block;"/></div>
			<div>
				<div class="result-wrap" >
					<div class="gua1 zjiang" style="">
						<span>恭喜中奖<br>价值100元油卡</span>
					</div>
				</div>
				<div class="beizhu">
					<div style="color: #ffcc00;font-size: .14rem;line-height: .18rem;text-align: justify;margin-bottom: .2rem;">兑奖时间：请在活动当天到意向经销商处领取礼品，如未到活动现场领取礼品，则视为自动放弃，不再补发礼品。经销商会通过您留下的电话号码与您沟通参与活动以及领奖事宜，请注意报名资料有效准确。</div>
					<div>
						<p class="name" style="font-size: .16rem;">抽奖规则：</p>
						<p class="info">
							1、每位用户限参与一次抽奖。中奖手机号码只可填写一次，不可重复领奖。</br>
							2、报名电话必须正确填写，经销商会通过您留下的电话号码与您沟通参与活动以及领奖事宜，请注意报名资料有效准确。</br>
							3、每位用户需在兑换奖品时提供与报名时一致的电话与姓名，否则无法兑奖。报名信息（电话、姓名）为中奖后的唯一兑奖凭证，必须真实填写，由现场工作人员核实后方可领奖。</br>
							4、每位中奖用户需到活动现场意向经销商处进行奖品领取；中奖用户如未到现场，则视为自动放弃，不再补发奖品。</br>
							5、更多活动详情咨询活动经销商。</br>
							6、成功报名后才可获得有效抽奖资格，以报名名单为准，活动报名截止时间：2018年7月12日24时。</br>
							7、长安福特保留对本活动的最终解释权。
						</p>
					</div>
					<div style="font-size: .18rem;font-weight: bold;font-style: italic;color: #f00;margin: .1rem 0 .4rem;">信息如实填写，否则不能兑奖</div>
					<div style="text-align: center;padding-bottom: .6rem;">
						<a class="home-btn" href="https://q.eqxiu.com/s/AQah4r9f">返回主页</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 未中奖 -->
		<div class="temp" style="display: none;">
			<div style="margin-top: .308rem">
				<div class="result-wrap" >
					<div class="gua1 zjiang" style="">
						<span>您未中奖<br>谢谢参与</span>
					</div>
				</div>
				<div class="beizhu">
					<div>
						<p class="name" style="font-size: .16rem;">抽奖规则：</p>
						<p class="info">
							1、每位用户限参与一次抽奖。中奖手机号码只可填写一次，不可重复领奖。</br>
							2、报名电话必须正确填写，经销商会通过您留下的电话号码与您沟通参与活动以及领奖事宜，请注意报名资料有效准确。</br>
							3、每位用户需在兑换奖品时提供与报名时一致的电话与姓名，否则无法兑奖。报名信息（电话、姓名）为中奖后的唯一兑奖凭证，必须真实填写，由现场工作人员核实后方可领奖。</br>
							4、每位中奖用户需到活动现场意向经销商处进行奖品领取；中奖用户如未到现场，则视为自动放弃，不再补发奖品。</br>
							5、更多活动详情咨询活动经销商。</br>
							6、成功报名后才可获得有效抽奖资格，以报名名单为准，活动报名截止时间：2018年7月12日24时。</br>
							7、长安福特保留对本活动的最终解释权。
						</p>
					</div>
					<div style="font-size: .18rem;font-weight: bold;font-style: italic;color: #f00;margin: .1rem 0 .4rem;">信息如实填写，否则不能兑奖</div>
					<div style="text-align: center;padding-bottom: .4rem;">
						<a class="home-btn" href="https://q.eqxiu.com/s/AQah4r9f">返回主页</a>
					</div>
				</div>
			</div>
		</div>	
			<audio style="display: block !important; " id="bg-music" preload="auto" src="${basepath}/static/music/h5a.mp3" loop="loop"></audio>
		<!--<img src="img/c1.png" style="position:absolute;bottom:0;left:0;width:100%"/>-->
		<input id="iswin" value="${winflag}" type="hidden"></input>
	</div>
	

<script type="text/javascript"  src="${basepath}/static/js/jquery-1.9.1.js"></script>
<script type="text/javascript"> 
	
var fts;
(function () {
	var setFont = function () {
		var wd = window.innerWidth<screen.width?screen.width: window.innerWidth;
		var width = wd>750?750: wd;
		fts = width/3.75;//23.438
		console.log("fts="+fts)
		var agent = navigator.userAgent;
		document.documentElement.style.fontSize = fts + 'px'
	}
	setFont();
//	var window_width = window.innerWidth, calc_window_width;
//	calc_window_width = window_width>750?750: window_width;
//	document.documentElement.style.fontSize = calc_window_width/3.75 + 'px'
	window.onresize=function () {
		setFont();
	}
	
})();

var isOk = $("#iswin").val();
var gua = 1,re = 2;  // 可设置刮奖次数

autoPlayMusic();
var isP = true;

var imgSrc = '${basepath}/static/img/a1.png';
var imgSrc2 = '${basepath}/static/img/a3.png';

function showdiv() { 
	 document.getElementById("show").style.display ="block";
}

function hidediv() {
	 document.getElementById("show").style.display ='none';
}
$(function () {
	
	var height = 1.2*fts;
	var width  = 2.4*fts;
	if(gua > 0){
		bodys(height,width);
	}
});	
function bodys(height,width){
	var img = new Image();         
	var canvas = document.querySelector('canvas');         
	canvas.style.position = 'absolute';           
	img.addEventListener('load',function(e){  
		var ctx;
		var w = width, h = height;             
		var offsetX = canvas.offsetLeft+$('#gua1').offset().left, offsetY = canvas.offsetTop+$('#gua1').offset().top;             
		var mousedown = false;               
		function layer(ctx){     	
			ctx.fillStyle = '#c1c1bf';                 
			ctx.fillRect(0, 0, w, h);   
			ctx.font="bold "+.32*fts+"px Georgia";		
            var gradient=ctx.createLinearGradient(0,0,w,0);
            gradient.addColorStop("0","red");
            gradient.addColorStop("0.5","red");
            gradient.addColorStop("1.0","red");	
            ctx.fillStyle=gradient;
            ctx.fillText("刮一刮 抽油卡",.20*fts,.70*fts);			
		}   
		function eventDown(e){ 		
			e.preventDefault();                 
			mousedown=true;             
		}   
		function eventUp(e){  			
			e.preventDefault();                 
			mousedown=false;   
			if(!ctx) return;
			var data = ctx.getImageData(0,0,canvas.width,canvas.height).data, j;
            console.log(data);
            for (i=0,j=0;i<data.length;i+=4){
                if(data[i]&&data[i+1]&&data[i+2]&&data[i+3]){

                    j++;
                }
            }
            console.log('j='+j);
            //假如j的数量小于等于图片的0.5了，就全清除
            if(j<=canvas.width*canvas.height*0.5){
                ctx.clearRect(0,0,canvas.width,canvas.height);
                //刮刮卡刮完后,可以在这里写回调事件

                //刮出终极大奖
                //首先判断活动是否开启
                /*if(!getkeyStatus){
                    //活动尚未开启
                    return false;
                }*/
                //活动开启后,判断用户的积分是否满5分
                if(isOk == 1){//成功
                    $(".temp").eq(1).fadeIn(300).siblings('.temp').hide();
                }else {//失败
                    $(".temp").eq(2).fadeIn(300).siblings('.temp').hide();
                }

            }
		}               
		function eventMove(e){ 			
			e.preventDefault();                 
			if(mousedown){                     
				if(e.changedTouches){                         
					e=e.changedTouches[e.changedTouches.length-1];                     
				}                     
				var x = (e.clientX + document.body.scrollLeft || e.pageX) - offsetX || 0,                         
				y = (e.clientY + document.body.scrollTop || e.pageY) - offsetY || 0;                     
				with(ctx){        				
					beginPath()                     
					arc(x, y, 15, 0, Math.PI * 2);                         
					fill();                     
				}                
			}             
		}   
        
		canvas.width=w;             
		canvas.height=h; 
		
		canvas.style.backgroundImage='url('+img.src+')';              
		ctx=canvas.getContext('2d');         
		ctx.fillStyle='b9b9b9';             
		ctx.fillRect(0, 0, w, h);
		
		layer(ctx);               
		ctx.globalCompositeOperation = 'destination-out';               
		canvas.addEventListener('touchstart', eventDown);             
		canvas.addEventListener('touchend', eventUp);             
		canvas.addEventListener('touchmove', eventMove);             
		canvas.addEventListener('mousedown', eventDown);             
		canvas.addEventListener('mouseup', eventUp);             
		canvas.addEventListener('mousemove', eventMove);  		
	});
	
	if(isOk == 1){
		img.src = imgSrc;
	}else{
		img.src = imgSrc2;
	}
	(document.body.style);
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