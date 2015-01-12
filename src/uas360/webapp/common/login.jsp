<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="物业360">
    <meta name="keywords" >
    
	<title><spring:message code="core.login.title" text="登录" /></title>
    <!-- ======================================================================================== -->
    <link href="${ctx}/uas360/favicon.ico" type="image/x-icon" rel=icon>
    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Validator CSS -->
    <link href="../uas360/css/bootstrapValidator.min.css" rel="stylesheet" >
    <link href="../uas360/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" >
    <!-- Custom CSS -->
    <link href="../uas360/css/style.css" rel="stylesheet">
    <link href="../uas360/css/index.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${ctx}/plugin/jquery/jquery.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="${ctx}/plugin/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Plugin JavaScript -->
    <script src="../uas360/js/jquery.easing.min.js"></script>
    <!-- Plugin JavaScript bootstrapValidator-->
    <script src="../uas360/js/bootstrapValidator.min.js"></script>
    <!-- ajax submit -->
    <script src="../uas360/js/jquery.form.js"></script>
    
    <!-- my js -->
    <script src="../uas360/javascripts/uas360.js"></script>
    <!-- Index JavaScript -->
    <script src="../uas360/javascripts/index.js"></script>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- ======================================================================================== -->
	<script type="text/javascript">
  		function checkcode(){
  			$.ajax({
					'url':'captchaAjax',
					'type':'post',
					'data':'inputcode=' + $('#codeinput').val(),
					'dataType':'text',
					'success':function(data){
							var result=data;
							if(result==1){
									$('#checkcodemsg').css({color:"green"});
									$('#checkcodemsg').text('验证码正确');
									// 提交按钮可用
									$("#loginBtn").removeAttr('disabled');
							}else{
									$('#checkcodemsg').css({color:"red"});
									$('#checkcodemsg').text('验证码错误，请重新输入');
									// 提交按钮不可用
									$("#loginBtn").attr('disabled',' true');
							}
					}
				});
  		}
  </script>

</head>

<body onload="document.f.j_username.focus();" id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <input id="param_error" type="hidden" value="${param.error}">
    <!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
	                <i class="fa fa-bars"></i>
	            </button>
	            <a class="navbar-brand page-scroll" href="#page-top">
	                <i class="fa fa-play-circle"></i> 返回
	            </a>
	        </div>
	
	        <!-- Collect the nav links, forms, and other content for toggling -->
	        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
	            <ul class="nav navbar-nav">
	                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
	                <li class="hidden">
	                    <a href="#page-top"></a>
	                </li>
	                <li>
	                    <a class="page-scroll" href="#login">登录</a>
	                </li>
	                <li>
	                    <a class="page-scroll" href="#download">下载</a>
	                </li>
	                <li>
	                    <a class="page-scroll" href="#contact">联系我们</a>
	                </li>
	            </ul>
	        </div>
	        <!-- /.navbar-collapse -->
	    </div>
	    <!-- /.container -->
	</nav>
	
	<!-- Intro Header -->
	<header class="intro">
	    <div class="intro-body">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-8 col-md-offset-2">
	                    <h1 class="brand-heading">物业360</h1>
	                    <h3 >打造价值生活</h3>
	                    <h3 class="intro-text">社区型综合服务平台</h3>
	                    <a href="#login" class="btn btn-circle page-scroll">
	                        <i class="fa fa-angle-double-down animated"></i>
	                    </a>
	                </div>
	            </div>
	        </div>
	    </div>
	</header>
	
	<!-- ================================================================================= -->
	<!-- 登录失败返回信息 
    <div class="alert alert-dismissable alert-warning"${param.error==true ? '' : 'style="display:none"'}>
		<strong><spring:message code="core.failure.save" text="登陆失败" /></strong> &nbsp;
		${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
	</div>-->
	<!-- ================================================================================= -->
	
	<!-- About Section -->
	<section id="login" class="container  text-center intro">
	    <div class="row loginDiv" >
	        <!-- 并监听默认的URL  j_spring_security_check 提交登陆信息的URL地址-->
			<form id="loginForm" name="f" method="post" action="${scopePrefix}/j_spring_security_check" class="form-horizontal col-lg-8 col-lg-offset-2 col-sm-8 col-sm-offset-2">
	            <h2>登录</h2>
	
	            <div class="form-group">
	
	                <div class="input-group">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
	                    <input type='text' id="username" name='j_username' class="form-control" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" placeholder="请输入登录名" autocomplete="off">
	                </div>
	            </div>
	            <!-- 密码 -->
	            <div class="form-group">
	                <div class="input-group">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                    <input type='password' id="password" name='j_password' class="form-control" placeholder="请输入密码">
	                </div>
	            </div>
	            <!-- 验证码 -->
	            <div class="form-group">
	                <div class="input-group">
	                    <img src="checkcode" id="img1" onclick="document.getElementById('img1').src='${scopePrefix}/common/checkcode?' + Math.random();" />
	                </div>
	            </div>
	            <div class="form-group">
	                <div class="input-group">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
	                    <input name="number" class="form-control" id="codeinput" onkeyup='checkcode()' placeholder="请输入验证码"/><span STYLE="color: red" id="checkcodemsg"></span><br/>
	                </div>
	            </div>
	            <input id="loginBtn" class="btn btn-default col-lg-4 col-lg-offset-4" name="submit" type="submit" value="<spring:message code='core.login.submit' text='提交'/>"  disabled="disable" />
        
	        </form>
	
	    </div>
	</section>
	
	<!-- Download Section -->
	<section id="download" class="content-section text-center intro">
	    <div class="row downloadDiv">
	        <div class="container">
	            <div class="col-lg-8 col-lg-offset-2">
	                <h2>下载 eHomeApp</h2>
	                <div class="down">
	                    <a href="http://startbootstrap.com/template-overviews/grayscale/" >
	                        <span class="btn btn-down-iphone" ></span>
	                    </a><br/>
	                    <img src="../uas360/img/code.png">
	                </div>
	                <div class="down">
	                <a href="http://startbootstrap.com/template-overviews/grayscale/" >
	                    <span class="btn btn-down-android" ></span>
	                </a><br/>
	                    <img src="../uas360/img/code.png">
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	
	<!-- Contact Section -->
	<section id="contact" class="container content-section text-center intro">
	    <div class="row contactDiv">
	        <div class="col-lg-8 col-lg-offset-2">
	            <h2>巨米科技发展有限公司</h2>
	            <p style="text-align: left">
	                &nbsp;&nbsp;&nbsp;&nbsp;巨米科技发展有限公司成立于2012年， 是目前中国基于社区服务的互联网综合服务提供商之一，也是中国基于社区服务用户最多的互联网企业之一。
	                成立以来，一直秉承一切以用户价值为依归的经营理念，始终处于稳健、高速发展的状态。我们的目标是为我们的客户打造完美价值生活。
	
	            </p>
	
	
	            <ul class="list-inline banner-social-buttons">
	                <li>
	                    <a href="#" class="btn btn-default btn-lg"><img src="../uas360/img/blog.png"><span class="link">微博</span></a>
	                </li>
	                <li>
	                    <a href="#" class="btn btn-default btn-lg"><img src="../uas360/img/mobile.png"> <span  class="link">电话</span></a>
	                </li>
	                <li>
	                    <a href="#" class="btn btn-default btn-lg"><img src="../uas360/img/email.png"><span  class="link">电邮</span></a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</section>
	<!-- Footer -->
	<footer class="navbar-static-bottom" style="margin-top: 10px;height: 20px">
	    <div class="container text-center" >
	        <p>版权所有 &copy; 哈尔滨市巨米科技发展有限公司 2014</p>
	    </div>
	</footer>
	
	<!-- 消息提示对话框 -->
	<div class="modal fade" id="infoDialog" tabindex="-1" role="dialog"
	     data-backdrop="static" data-keyboard="false" data-show="false">
	    <div class="modal-dialog" >
	        <div class="modal-content">
	            <div class="modal-body" style="text-align: center;">
	                <span class="info">
	                ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
	                </span>
	            </div>
	
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
</body>
	<script type="text/javascript">
	/** 验证用户名密码是否正确 */
	$(document).ready(function() {
		// 验证用户名密码是否正确
		if (document.getElementById("param_error").value) {
			var $dialog=$('#infoDialog').modal('show');
			$dialog.find('.info').removeClass().addClass('info loading').text('登录数据上传中。。。');
			$dialog.find('.info').removeClass().addClass('info unchecked').text('登录名或密码错误。。。');
		//	$("#infoDialog").attr("class","info unchecked");
		//	$("#infoDialog").attr("text","登录名或密码错误。。。");
	        setTimeout(function(){
	            clearForm();
	            $("#infoDialog").modal('hide');
	        },2000);
		}
	});
	
	</script>

</html>
