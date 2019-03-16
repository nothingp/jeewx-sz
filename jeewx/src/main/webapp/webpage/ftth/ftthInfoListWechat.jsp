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
		<title>佛山移动宽带报装</title>
		<script type="text/javascript" src="${webRoot}/toAdd/src/js/resize.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script src="//cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
		<script src="${webRoot}/plug-in/jquery-ui-1.11.4/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="${webRoot}/toAdd/src/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${webRoot}/plug-in/jquery-ui-1.11.4/jquery-ui.css">

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
				background: transparent url('${webRoot}/toAdd/images/header.png') no-repeat left top/ 100% auto ;
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
			.tab-two h2{
				width: 1.42rem;
				margin-top: 0.25rem;
				font-size: 0.2rem;
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
				max-height: 0.8rem;
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
					link: 'http://www.10086ftth.cn/Wechat/ftthInfoController.do?reward&resellOpenId=${openId}', // 分享链接
					imgUrl: 'http://www.10086ftth.cn/Wechat/toAdd/images/header.png', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
					},
					cancel: function () {
						// 用户取消分享后执行的回调函数
					}
				});

				wx.onMenuShareAppMessage({
					title: '抢！抢！抢！宽带', // 分享标题
					desc: '佛山移动光宽带有奖报装', // 分享描述
					link: 'http://www.10086ftth.cn/Wechat/ftthInfoController.do?reward&resellOpenId=${openId}', // 分享链接
					imgUrl: 'http://www.10086ftth.cn/Wechat/toAdd/images/header.png', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
					},
					cancel: function () {
						// 用户取消分享后执行的回调函数
					}
				});
			});


			function selectFrontImage(){
				wx.chooseImage({
					count: 1, // 默认9
					sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
					success: function (res) {
						var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						$('#idCardFrontImg').attr('src',localIds[0]);
//alert(localIds[0]);
						wx.uploadImage({
							localId: localIds[0], // 需要上传的图片的本地ID，由chooseImage接口获得
							isShowProgressTips: 1, // 默认为1，显示进度提示
							success: function (res) {
								var serverId = res.serverId; // 返回图片的服务器端ID
								//alert(serverId);
								$('#idCardFront').val(serverId);
							}
						});
					}
				});
			}

			function selectBackImage(){
				wx.chooseImage({
					count: 1, // 默认9
					sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
					success: function (res) {
						var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						$('#idCardBackImg').attr('src',localIds[0]);
						wx.uploadImage({
							localId: localIds[0], // 需要上传的图片的本地ID，由chooseImage接口获得
							isShowProgressTips: 1, // 默认为1，显示进度提示
							success: function (res) {
								var serverId = res.serverId; // 返回图片的服务器端ID
								//alert(serverId);
								$('#idCardBack').val(serverId);
							}
						});
					}
				});
			}

			function submitForm(){

				if($("#name").val()==''){
					alert('请输入联系人！');
					return false;
				}

				if($("#phone").val()==''){
					alert('请输入联系电话！');
					return false;
				}

				if($("#addressName").val()==''){
					alert('请输入小区信息！');
					return false;
				}


				if($("#addressTail").val()==''){
					alert('请输入详细楼层信息！');
					return false;
				}

				if(false&&$("#idCardFront").val()==''){
					alert('请选择身份证照片！');
					return false;
				}

				if(false&&$("#idCardBack").val()==''){
					alert('请选择身份证照片！');
					return false;
				}

				$("#address").val($("#addressPre").val()+'---'+$("#addressTail").val());
				//alert($("#addressPre").val()+'---'+$("#addressTail").val());


				ftthForm.submit();
			}



			$(document).ready(function () {
				$("#addressRegion").change(function(){
					var value = $("#addressRegion").val();
					 // 先清空第二个
					//加载数据
					 $.ajax({url:"ftthInfoController.do?getFtthAddressByRegion",
					  data:{
						region:value
					  },dataType: "json",
						type: "post",
						success:
					  function(data){
						//alert("Data: " + data + "\nStatus: " );
						var optList = data.obj;

						var availableTags = [];
						for(var i=0;i<optList.length;i++){
							availableTags.push({label:optList[i].name,value:optList[i].name,address:optList[i].address});
							   // 实际的应用中，这里的option一般都是用循环生成多个了
//							   var option = $("<option>").val(optList[i].name).text(optList[i].name);
//							   option.attr('address',optList[i].address)
//							   $("#addressName").append(option);
						}
						$("#addressName").val('');
						$("#addressName").autocomplete({
							source: availableTags,
							position: { my : "left bottom", at: "left top" },
							change: function( event, ui ) {
								//alert(ui.item.address);
								$("#addressPre").val(ui.item.address);
							}
						});
//						$("#addressName option").eq(0).attr("selected",true);
//						$("#addressName").trigger("change");
					  }});
				});


//				$("#addressName").change(function(){
//					var checkOpt=$("#addressName").find("option:selected");
//					$("#addressPre").val(checkOpt.attr('address'))
//
//				});

				$("#addressRegion option").eq(0).attr("selected",true);
				$("#addressRegion").trigger("change");
			});
		</script>
	</head>

	<body>
		<header>
			<h1>宽带支付说明</h1>
		</header>
		<section class="white-container first">
			<div class="tab-one">
				<h1>宽带普惠资费</h1>
                                <!--<p>办理两年独宽带，加送六个月</p> -->
				<table>
					<thead>
						<tr>
							<th>带宽</th>
							<th>资费/1年</th>
						<!--<th>30个月资费</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20M</td>
							<td><span style="text-decoration:line-through;color:gray">720</span> 360元</td>
							<!--<td><span style="text-decoration:line-through;color:gray">1440</span> 1200元</td>-->
						</tr>
						<tr>
							<td>50M</td>
							<td><span style="text-decoration:line-through;color:gray">1080</span> 600元</td>
						<tr>
							<td>100M</td>
							<td><span style="text-decoration:line-through;color:gray">1200</span> 720元</td>
							<!--<td><span style="text-decoration:line-through;color:gray">2400</span> 1680元</td>-->
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-two">
				<h1>宽带普惠资费</h1>
				<p>88元不限量套餐<strong>100M光纤免费用</strong></p>
				<%--<p>158元4G套餐用户<strong>送20M光宽带一年</strong></p>--%>
				<%--<p>188元或以上4G套餐用户<strong>送50M光宽带一年</strong></p>--%>
				<%--<p class="tip">办理手机58元或以上4G套餐，并承诺使用一年套餐(承诺期内套餐允许变更为更高价格4G套餐)。</p>--%>
				<table>
					<thead>
						<tr>
							<th width='110px' >4G套餐档次</th>
							<th colspan="3">
								<table>
									<tr>
										<th colspan="3">宽带优惠月套餐</th>
									</tr>
									<tr class="white">
										<td>20M</td>
										<td>50M</td>
										<td>100M</td>
										<%--<td>100M</td>--%>
									</tr>
								</table>
							</th>
						</tr>
					</thead>
					<tbody>
                                                <tr>
                                                        <td>18元-38元</td>
                                                        <td>20元</td>
                                                        <td>30元</td>
                                                        <td>40元</td>
                                                        <%--<td>40元</td>--%>
                                                </tr>
						<tr>
							<td>58元</td>
							<td>免费用</td>
							<td>10元</td>
							<td>20元</td>
							<%--<td>40元</td>--%>
						</tr>
						<tr>
							<td>88不限量套餐</td>
							<td>--</td>
							<td>--</td>
							<td>免费用</td>
							<%--<td>30元</td>--%> 
						<%--</tr>--%>
						<tr>
							<td>138或以上不限量套餐</td>
							<td>--</td>
							<td>--</td>
							<td>免费用</td>
						</tr>
                                                <tr><td class="blue" colspan="4">所有套餐赠送宽带电视一年</td><tr>
					</tbody>
				</table>
			</div>
			<div class="tab-two" style="display:none">
				<h2>合家欢套餐</h2>
				<table>
					<thead>
						<tr>
							<th width='110px' >合家欢套餐</th>
							<th colspan="3">
								<table>
									<tr>
										<th colspan="3">4G套餐档次</th>
									</tr>
									<tr class="white">
										<td>38-58元</td>
										<td>88-158元</td>
										<td>188元及以上</td>
										<%--<td>100M</td>--%>
									</tr>
								</table>
							</th>
						</tr>
					</thead>
					<tbody>
                                                <tr>
                                                        <td>套餐资费</td>
                                                        <td>40/90元</td>
                                                        <td>30/50元</td>
                                                        <td>10/30元</td>
                                                </tr>
						<tr>
							<td>带宽</td>
							<td colspan="3">100M</td>
						</tr>
						<tr>
							<td>电视服务</td>
							<td colspan="3">高清电视服务</td>
						</tr>
						<tr>
							<td>流量</td>
							<td colspan="3">3G/30G</td>
						</tr>
						<tr>
							<td>语音</td>
							<td colspan="3">300分钟</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<section class="white-container text-tip">
			<p style="display:none">
				<strong>其他运营商宽带</strong>只要：<br />
				<strong>转用中国移动光纤宽带</strong><br />
				就可获得<strong>200大元</strong>话费!
			</p>
			<%--<p>--%>
				<%--老客户的小伙伴只要：<br />--%>
				<%--<strong>提前续费一个月</strong>	<br />--%>
				<%--也可获得<strong>100大元</strong>话费！--%>
			<%--</p>--%>
			<p >
				新装宽带的小伙伴是要<strong>缴纳200元</strong>初装费(在宽带安装好之后由装维师傅收取)
			</p>
			<p >
				咨询热线：89992222
			</p>
		</section>

		<section class="form" >

			<h1> <c:if test="${not empty sessionScope.randomCoupon}">（已中奖${sessionScope.randomCoupon}元）</c:if></h1>

			<form method="post" class="form-content" id="ftthForm" action="ftthInfoController.do?saveFtthInfoWechat" onsubmit="return validate()">
				<input type="hidden" id="coupon" name="coupon" value="0" />
				<input type="hidden" id="openId" name="openId" value="${sessionScope.openId}"/>
				<input type="hidden" id="resellOpenId" name="resellOpenId" value="${sessionScope.resellOpenId}"/>
				<input type="hidden" id="state" name="state" value="1" />
				<input type="hidden" id="packagePrice" name="packagePrice" />
				<input type="hidden" id="address" name="address" />
				<div><label ><span>联系人</span><input id="name" name="name" type="text" placeholder="请输入您的真实姓名" ></label></div>
				<div><label ><span>联系电话</span><input id="phone" name="phone" type="text" placeholder="请输入您的电话" ></label></div>
				<div><label ><span>手机套餐</span><select id="phonePackage" name="phonePackage">
					<option value="0">无套餐</option>
                                        <option value="48" >18-38元</option>
					<option value="58" selected>58元</option>
					<option value="158">88元</option>
					<option value="188">138元及以上</option>
				</select></label></div>
				<div><label ><span>宽带速率</span><select id="lanLevel" name="lanLevel">
					<%--<option value="12">12M</option>--%>
					<option value="20">20M</option>
					<option value="50">50M</option>
					<option value="100">100M</option>
				</select></label></div>
				<div><label ><span>报装类型</span><select id="lanType" name="lanType">
					<option value="1">新装</option>
					<option value="2">续费</option>
				</select></label></div>
				<div><label ><span>报装年限</span><select id="lanYear" name="lanYear">
					<option value="1">一年</option>
					<option value="2">两年</option>
				</select></label></div>
				<div><label ><span>小区地址</span><select id="addressRegion" name="addressRegion">
					<option value="顺德">顺德</option>
					<option value="南海">南海</option>
					<option value="禅城">禅城</option>
					<option value="三水">三水</option>
					<option value="高明">高明</option>
				</select></label></div>
				<div><label ><span></span></label><input name="addressName" id="addressName" type="text" placeholder="请输入小区关键字" ></div>
				<div style="display: none"><label ><span>小区地址</span><input name="addressPre" id="addressPre"  type="text" placeholder="如：几栋几楼" ></label></label></div>
				<div><label ><span>详细楼层</span><input id="addressTail" name="addressTail" type="text" placeholder="如：几栋几楼" ></label></div>
				<p style="display:none">
					<span class="iden-tit">上传身份证</span>
					<span class="iden-tip">上传正面 > 上传背面 > 提交身份证</span>
				</p>
				<div class="iden-container" style="display:none">
					<div>
						<input type="hidden" id="idCardFront" name="idCardFront" />
						<img id="idCardFrontImg" src="${webRoot}/toAdd/images/iden-1.png" alt="正面">
						<a href="javascript:;" onclick="selectFrontImage()">上传正面</a>
					</div>
					<div>
						<input type="hidden" id="idCardBack" name="idCardBack" />
						<img id="idCardBackImg" src="${webRoot}/toAdd/images/iden-2.png" alt="背面">
						<a href="javascript:;" onclick="selectBackImage()">上传背面</a>
					</div>
				</div>
			</form>
		</section>

		<footer>
			<a onclick="submitForm()" class="submit-btn">提交宽带报装</a>
		</footer>
	</body>

</html>
