<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>业主缴费表编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">业主缴费表编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="charge_pay-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-payid">缴费编号ID:</label>
                          <div class="col-lg-3">   <input id="code-payid" type="text" name="payid" value="${model.payid}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-chargename">收费项目名:</label>
                          <div class="col-lg-3">    <select id="code-chargename" name="chargename" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${chargenameItems}" var="item">          <option value="${item.key}" ${item.key==model.chargename? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-chargestandard">应收金额:</label>
                          <div class="col-lg-3">   <input id="code-chargestandard" type="text" name="chargestandard" value="${model.chargestandard}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-payreal">实收金额:</label>
                          <div class="col-lg-3">   <input id="code-payreal" type="text" name="payreal" value="${model.payreal}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-paybalance">欠费金额:</label>
                          <div class="col-lg-3">   <input id="code-paybalance" type="text" name="paybalance" value="${model.paybalance}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-chargetime">收费时间:</label>
                          <div class="col-lg-3">   <input id="code-chargetime" type="text" name="chargetime" value="${model.chargetime}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-owername">业主名:</label>
                          <div class="col-lg-3">    <select id="code-owername" name="owername" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${owernameItems}" var="item">          <option value="${item.key}" ${item.key==model.owername? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                          
                          <label class="col-lg-2 control-label" for="code-paystate">缴费状态:</label>
                          <div class="col-lg-3">   <input id="code-paystate" type="text" name="paystate" value="${model.paystate}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-paymonth">缴费月份:</label>
                          <div class="col-lg-3">   <input id="code-paymonth" type="text" name="paymonth" value="${model.paymonth}" class="text " ></div>
                          
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
