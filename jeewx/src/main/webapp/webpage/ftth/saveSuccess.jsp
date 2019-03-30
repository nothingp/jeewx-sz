<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
		<meta charset="utf-8"/>
		<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name='apple-touch-fullscreen' content='yes'>
		<meta name="full-screen" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta name="format-detection" content="address=no">
		<title>移动宽带报装</title>

		<script type="text/javascript" src="${webRoot}/toAdd/src/js/resize.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<link rel="stylesheet" type="text/css" href="${webRoot}/toAdd/src/css/reset.css">

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
				background-color: #058be2;
			  	color: #058be2;
				font-family: 'Microsoft YaHei',Helvetica,Arial,sans-serif;
				font-size: 12px;
				overflow-y: scroll;
				direction: ltr;
				font-size: 100px;
			}
			.back{
				color: #000;
			}
			header{
				background: transparent url('${webRoot}/toAdd/images/header2.png') no-repeat left top/ 100% auto ;
				height: 1.3rem;
				width: 100%;
			}
			header h1{
				background: transparent url('${webRoot}/toAdd/images/title.png') no-repeat left bottom/ 100% auto;
				width: 1.45rem;
				height: 0.25rem;
				text-indent: -9999px;
				margin: 0 auto;
				padding-top: 1.65rem;
			}
			.white-container{
				margin: 0.11rem 0.11rem 0;
				background-color: #fff;
				border-radius: 0.1rem;
				padding: 0.15rem;
			}
			.white-container.first{
				margin-top: 0.55rem;
			}
			.tab-one,.tab-two{
				font-size: 0.12rem;
			}
			.tab-one h1,.tab-two h1{
				background: transparent url('${webRoot}/toAdd/images/h-one.png') no-repeat left top/ 100% auto;
				width: 1rem;
				height: 0.17rem;
				text-indent: -9999px;
				margin: 0.15rem 0 0.1rem;
			}
			.tab-two h1{
				background: transparent url('${webRoot}/toAdd/images/h-two.png') no-repeat left top/100% auto;
				width: 1.42rem;
				margin-top: 0.25rem;
			}
			.tab-one table,
			.tab-two table{
				width: 100%;
				height: 100%;
				table-layout: fixed;
				text-align: center;
				border-spacing: 0;
				border-collapse: 0;
			}
			.tab-one table th,
			.tab-two table th{
				color: #fff;
				background-color: #0066a8;
				font-weight: bold;
				font-size: 0.14rem;
				height: 0.25rem;
				line-height: 0.25rem;
				border-left: 1px solid #868585;
				border-right: 1px solid #868585;
				vertical-align: middle;
			}
			.tab-one table td{
				color: #000;
				line-height: 0.2rem;
				height: 0.2rem;
				border: 1px solid #868585;
			}
			.tab-two p{
				line-height: 0.2rem;
				font-size: 0.14rem;
			}
			.tab-two p strong{
				font-weight: bold;
			}
			p.tip{
				color: #000;
				font-size: 0.12rem;
				line-height: 0.14rem;
				font-family: '黑体';
				margin: 0.05rem 0;
			}
			.tab-two table td{
				color: #000;
				border: 1px solid #868585;
				line-height: 0.2rem;
				height: 0.2rem;
			}
			.tab-two .white td{
				color: #fff;
			}
			.tab-two td.blue{
				color: #0066a8;
			}
			.text-tip p{
				font-size: 0.16rem;
				margin-bottom: 0.16rem;
				line-height: 0.2rem;
			}
			.text-tip p:last-child{
				margin-bottom: 0;
			}
			.text-tip p strong{
				font-weight: bolder;
			}
			.form{
				margin: 0.11rem 0.11rem 0;
				background-color: #fff;
				border-radius: 0.1rem;
				overflow: hidden;
			}
			.form h1{
				height: 0.36rem;
				border-top-left-radius: 0.1rem;
				border-top-right-radius: 0.1rem;
				font-size: 0.16rem;
				color: red;
				font-weight: bold;
				line-height: 0.36rem;
				text-indent: 1.7rem;
				background: #d9d9d9 url('${webRoot}/toAdd/images/h-three.png') no-repeat 20px center/ 50% auto;
			}
			.form-content{
				font-size: 0.18rem;
				margin: 0.15rem 0.12rem;
			}
			.form-content div{
				margin: 0.15rem 0;
			}
			.form-content div span{
				width: 0.9rem;
				display: inline-block;
			}
			.form-content div input{
				border-radius: 5px;
				border: 1px solid #c8c8c8;
				width: 1.8rem;
				height: 0.25rem;
				line-height: 0.25rem;
				font-size: 0.14rem;
				text-indent: 0.05rem;
			}
			.form-content div textarea{
				border-radius: 5px;
				border: 1px solid #c8c8c8;
				width: 1.8rem;
				line-height: 0.25rem;
				font-size: 0.14rem;
				text-indent: 0.05rem;
			}
			.form-content p .iden-tit{
				font-weight: bolder;
				font-size: 0.16rem;
			}
			.form-content p .iden-tip{
				font-weight: bolder;
				font-size: 0.12rem;
				color: #f55b36;
			}
			.iden-container{
				display: -webkit-box;
				-webkit-box-orient: horizontal;
			}
			.iden-container div{
				-webkit-box-flex: 1;
				-webkit-box-align: center;
				margin: 0;
				text-align: center;
			}
			.iden-container div img{
				width: 1.27rem;
				display: block;
				margin: 0 auto;
				font-size: 0;
			}
			.iden-container div a{
				display: inline-block;
				background-color: #058be2;
				border-radius: 5px;
				width: 0.8rem;
				height: 0.3rem;
				line-height: 0.3rem;
				color: #fff;
				font-weight: bolder;
				margin-top: 0.15rem;
				font-size: 0.14rem;
			}
			.submit-btn{
				margin: 0.2rem 0.11rem;
				height: 0.36rem;
				line-height: 0.36rem;
				font-size: 0.18rem;
				background-color: red;
				display: block;
				text-align: center;
				border-radius: 10px;
				border: 1px solid #013c63;
				color: #fff;
			}

			select{
				height: 0.25rem;
				line-height: 0.25rem;
				vertical-align: 3px;
				width: 1.8rem;
				border-radius: 5px;
				border: 1px solid #c8c8c8;
			}
		</style>
		<script type="text/javascript">
			/* wx.config({
				debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				appId: ${appId}, // 必填，公众号的唯一标识
				timestamp: ${timeStamp}, // 必填，生成签名的时间戳
				nonceStr: '${nonceStr}', // 必填，生成签名的随机串
				signature: '${signature}',// 必填，签名，见附录1
				jsApiList: ['chooseImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});

			function selectFrontImage(){
				alert('123');
				wx.chooseImage({
					count: 1, // 默认9
					sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
					success: function (res) {
						var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
					}
				});
			} */

			function validate(){

			}
		</script>
	</head>

	<body>
		<header>
			<h1>宽带报装成功</h1>
		</header>
		<section class="white-container text-tip">
<%-- 			<p>
				感谢报装！套餐价格：<strong>${price}元</strong>（宽带新装已包含200元初装费）
			</p> --%>
			<p>
				移动公司装维人员将会在<strong>三个工作日</strong>内与您预约上门<strong>安装时间</strong>，
				请<strong>保持电话畅通</strong>。<br />
			</p>
		</section>
		<footer>
			<a href="weixinFtthInfoController.do?myWallet" class="submit-btn">确定</a>
		</footer>
	</body>

</html>