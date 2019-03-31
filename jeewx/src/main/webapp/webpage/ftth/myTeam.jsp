<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8"/>
		<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name='apple-touch-fullscreen' content='yes'>
		<meta name="full-screen" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta name="format-detection" content="address=no">
		<title>我的团队</title>

		<script type="text/javascript" src="${webRoot}/wallet/src/js/resize.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
		<script src="//cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${webRoot}/wallet/src/css/reset.css">

		<script>
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "//hm.baidu.com/hm.js?ff7a806e9edd6bf829749715c66bde58";
		  var s = document.getElementsByTagName("script")[0];
		  s.parentNode.insertBefore(hm, s);
		})();
		</script>
		<style type="text/css">
			html{
			  	color: #787878;
				font-family: 'Microsoft YaHei',Helvetica,Arial,sans-serif;
				font-size: 12px;
				overflow-y: scroll;
				direction: ltr;
				font-size: 100px;
				height: 100%;
			}
			body{
				height: 100%;
			}
			header{
				height: 44%;
				width: 100%;
				background-color: #1c83c6;
				color: #fff;
			}
			header table{
				width: 100%;
				height: 100%;
				table-layout: fixed;
				text-align: center;
				vertical-align: middle;
			}
			header table td{
				border: 1px solid #3390cc;
				border-top: none;
				border-left: none;
				vertical-align: middle;
				font-size: 0.16rem;
			}
			header table td.lastrow {
				border-bottom: 0;

			}
			header table td.lastrow a {
				color: #fff;

			}
			header table td.lastCol {
				border-right: 0;
			}
			header table td p{
				line-height: 0.26rem;
			}
			header table td span{
				font-size: 0.24rem;
				font-weight: 500;
			}
			footer{
				background-color: #e6e6e6;
				height: 56%;
				width: 100%;
			}
			footer a{
				display: table;
				height: 20%;
				width: 100%;
				border-bottom: 1px solid #dbdbdb;
				color: #787878;
				font-size: 0.16rem;
			}
			footer a:last-child{
				border: none;
			}
			footer a div{
				position: relative;
				display: table-cell;
				vertical-align: middle;
				text-indent: 0.48rem;
			}
			.icon-1{
				background: transparent url('${webRoot}/wallet/images/01.png')  no-repeat 0.15rem center / 5% auto;
			}
			.icon-2{
				background: transparent url('${webRoot}/wallet/images/02.png')  no-repeat 0.15rem center / 5% auto;
			}
			.icon-3{
				background: transparent url('${webRoot}/wallet/images/03.png')  no-repeat 0.15rem center / 5% auto;
			}
			.icon-4{
				background: transparent url('${webRoot}/wallet/images/04.png')  no-repeat 0.15rem center / 5% auto;
			}
			.icon-5{
				background: transparent url('${webRoot}/wallet/images/05.png')  no-repeat 0.15rem center / 5% auto;
			}
			footer a span.big-tit{
				color: #1c83c6;
			}
			footer a span.sma-tit{
				color: #28a1f0;
				font-size: 0.14rem;
				padding-left: 0.25rem;
			}
			footer a div:after{
				content: '';
				position: absolute;
				width: 0.1rem;
				height: 0.1rem;
				border-width: 0 1px 1px 0;
				border-color: #787878;
				border-style: solid;
				right: 0.2rem;
				top: 50%;
				margin-top: -0.06rem;
				transform: rotate(-45deg);
				-webkit-transform: rotate(-45deg);
			}
		</style>
		<script type="text/javascript">
			wx.config({
				debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				appId: '${appId}', // 必填，公众号的唯一标识
				timestamp: ${timeStamp}, // 必填，生成签名的时间戳
				nonceStr: '${nonceStr}', // 必填，生成签名的随机串
				signature: '${signature}',// 必填，签名，见附录1
				jsApiList: ['chooseImage','uploadImage','onMenuShareTimeline','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});

			wx.ready(function(){
				wx.onMenuShareTimeline({
					title: '抢！抢！抢！宽带', // 分享标题
					link: '${preUrl}/weixinFtthInfoController.do?ftthInfoListWechat&resellOpenId=${openId}', // 分享链接
					imgUrl: '${preUrl}/toAdd/images/header.png', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
					},
					cancel: function () {
						// 用户取消分享后执行的回调函数
					}
				});

				wx.onMenuShareAppMessage({
					title: '抢！抢！抢！宽带', // 分享标题
					desc: '龙华移动光宽带有奖报装', // 分享描述
					link: '${preUrl}/weixinFtthInfoController.do?ftthInfoListWechat&resellOpenId=${openId}', // 分享链接
					imgUrl: '${preUrl}/toAdd/images/header.png', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
					},
					cancel: function () {
						// 用户取消分享后执行的回调函数
					}
				});
			});
		</script>
	</head>

	<body>
		<header>
			<table>
				<tr>
					<td>
						<p><span>${upperName}</span></p>
						<p>上级名称</p>
					</td>
				</tr>
				<tr>
					<td class="lastCol">
						<p><span>${teamCount}</span></p>
						<p>下级人数</p>
					</td>
				</tr>
			</table>
		</header>
		<footer>
			<a href="${webRoot}/toAdd/result.html"><div class="icon-1">我的资料</div></a>
			<a href="${webRoot}/toAdd/result.html"><div class="icon-3">优惠信息</div></a>
			<%-- <a href="${webRoot}/ftthInfoController.do?myQrCode"><div class="icon-4">我的二维码</div></a> --%>
			<%--<a href=""><div class="icon-5">我的宽带</div></a>--%>
		</footer>
	</body>

</html>