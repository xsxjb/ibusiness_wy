<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>楼栋信息表编辑</title>
    <%@include file="/common/center.jsp"%>
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <script type="text/javascript">
		$(function() {
		    $("#cgForm").validate({
		        submitHandler: function(form) {
		            if (typeof(bootbox) != 'undefined') {
					    bootbox.animate(false);
					    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
					}
					form.submit();
		        },
		        errorClass: 'validate-error'
		    });
		})
    </script>
    <div class="col-lg-1"></div>
    <!-- start of main -->
    <div class="panel panel-default col-lg-10"> 
        <div class="panel-heading"><h4 class="panel-title">楼栋信息表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="house_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-houseid">楼栋编号:</label>
                          <div class="col-lg-3">   <input id="code-houseid" type="text" name="houseid" value="${model.houseid}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-housename">楼栋名:</label>
                          <div class="col-lg-3">   <input id="code-housename" type="text" name="housename" value="${model.housename}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-buildstarttime">开工时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-buildstarttime" type="text" name="buildstarttime" value="${model.buildstarttime}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-buildendtime">竣工时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-buildendtime" type="text" name="buildendtime" value="${model.buildendtime}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-housebug">漏洞信息:</label>
                          <div class="col-lg-3">   <input id="code-housebug" type="text" name="housebug" value="${model.housebug}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-housearea">建筑面积:</label>
                          <div class="col-lg-3">   <input id="code-housearea" type="text" name="housearea" value="${model.housearea}" class="text " ></div>
                          
                            </div>
                  
                  <div class="form-group">
	                  <div class="col-lg-10 col-lg-offset-2">
	                      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
	                      <button type="button" onclick="history.back();" class="btn btn-default a-cancel"><spring:message code='core.input.back' text='返回'/></button>
	                  </div>
                  </div>
                </form>
        </div>
    </div>
    <!-- end of main -->
  </body>
</html>
