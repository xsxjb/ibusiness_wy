<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>车位/车库管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">车位/车库管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="carpark-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-stallname">车位名称:</label>
                          <div class="col-lg-3">   <input id="code-stallname" type="text" name="stallname" value="${model.stallname}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-area">面积:</label>
                          <div class="col-lg-3">  <input id="code-area" type="text" name="area" value="${model.area}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-roomid">房间ID:</label>
                          <div class="col-lg-3">    <select id="code-roomid" name="roomid" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${roomidItems}" var="item">          <option value="${item.key}" ${item.key==model.roomid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-rent">每月租金:</label>
                          <div class="col-lg-3">  <input id="code-rent" type="text" name="rent" value="${model.rent}" class="text number " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-describeremark">描述:</label>
                          <div class="col-lg-6">    <textarea class="form-control " id="code-describeremark" name="describeremark" rows="1" >${model.describeremark}</textarea></div>
                          
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
