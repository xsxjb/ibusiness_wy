<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>检修任务单编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">检修任务单编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="maintaintask-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-taskno">任务单号:</label>
                          <div class="col-lg-3">   <input id="code-taskno" type="text" name="taskno" value="${model.taskno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-taskuser">制单人:</label>
                          <div class="col-lg-3">  <label>${model.taskuser}</label>  <input id="code-taskuser" type="hidden" name="taskuser" value="${model.taskuser}" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-overhaulmethod">检修方式:</label>
                          <div class="col-lg-3">   <input id="code-overhaulmethod" type="text" name="overhaulmethod" value="${model.overhaulmethod}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-overhauluser">检修人:</label>
                          <div class="col-lg-3">    <select id="code-overhauluser" name="overhauluser" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${overhauluserItems}" var="item">          <option value="${item.key}" ${item.key==model.overhauluser? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-eventtime">开始日期:</label>
                          <div class="col-lg-3">  <div class="input-append datetimepicker date">  <span class="add-on">    <input data-format="yyyy-MM-dd hh:mm:ss" type="text" name="eventtime" value="${model.eventtime}" class="text required" maxlength="20" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-overhaulplandays">计划检修天数:</label>
                          <div class="col-lg-3">   <input id="code-overhaulplandays" type="text" name="overhaulplandays" value="${model.overhaulplandays}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-plancost">计划资金:</label>
                          <div class="col-lg-3">   <input id="code-plancost" type="text" name="plancost" value="${model.plancost}" class="text " ></div>
                          
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
