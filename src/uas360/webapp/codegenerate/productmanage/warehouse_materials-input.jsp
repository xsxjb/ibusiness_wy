<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>物料库存管理编辑</title>
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
        <div class="panel-heading"><h4 class="panel-title">物料库存管理编辑</h4></div>
        <div class="panel-body">
                <form id="cgForm" method="post" action="warehouse_materials-save.do" class="form-horizontal">
                  <c:if test="${model != null}">
                      <input id="code_id" type="hidden" name="id" value="${model.id}">
                  </c:if>
                  
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialtypeno">物料分类编号:</label>
                          <div class="col-lg-3">   <input id="code-materialtypeno" type="text" name="materialtypeno" value="${model.materialtypeno}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialno">物料编号:</label>
                          <div class="col-lg-3">   <input id="code-materialno" type="text" name="materialno" value="${model.materialno}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialname">物料名称:</label>
                          <div class="col-lg-3">   <input id="code-materialname" type="text" name="materialname" value="${model.materialname}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialmodel">规格型号:</label>
                          <div class="col-lg-3">   <input id="code-materialmodel" type="text" name="materialmodel" value="${model.materialmodel}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialprice">价格:</label>
                          <div class="col-lg-3">   <input id="code-materialprice" type="text" name="materialprice" value="${model.materialprice}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-materialunit">单位:</label>
                          <div class="col-lg-3">   <input id="code-materialunit" type="text" name="materialunit" value="${model.materialunit}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-materialnum">数量:</label>
                          <div class="col-lg-3">   <input id="code-materialnum" type="text" name="materialnum" value="${model.materialnum}" class="text " ></div>
                          
                          <label class="col-lg-2 control-label" for="code-warehouseno">仓库编号:</label>
                          <div class="col-lg-3">   <input id="code-warehouseno" type="text" name="warehouseno" value="${model.warehouseno}" class="text " ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-warehousename">仓库名称:</label>
                          <div class="col-lg-3">   <input id="code-warehousename" type="text" name="warehousename" value="${model.warehousename}" class="text " ></div>
                          
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
