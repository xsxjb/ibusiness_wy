<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>房间信息编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">房间信息编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="room_info-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-roomid">房间编号:</label>
                          <div class="col-lg-3">   <input id="code-roomid" type="text" name="roomid" value="${model.roomid}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-roomname">房间名:</label>
                          <div class="col-lg-3">   <input id="code-roomname" type="text" name="roomname" value="${model.roomname}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-houseid">所属楼栋编号:</label>
                          <div class="col-lg-3">    <select id="code-houseid" name="houseid" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${houseidItems}" var="item">          <option value="${item.key}" ${item.key==model.houseid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-ownerid">业主编号:</label>
                          <div class="col-lg-3">   <input id="code-ownerid" type="text" name="ownerid" value="${model.ownerid}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-entertime">入住时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-entertime" type="text" name="entertime" value="${model.entertime}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-roomtype">房型:</label>
                          <div class="col-lg-3">   <input id="code-roomtype" type="text" name="roomtype" value="${model.roomtype}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-roomarea">建筑面积:</label>
                          <div class="col-lg-3">  <input id="code-roomarea" type="text" name="roomarea" value="${model.roomarea}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-roompurpose">房间用途:</label>
                          <div class="col-lg-3">   <input id="code-roompurpose" type="text" name="roompurpose" value="${model.roompurpose}" class="text " ></div>
                          
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
