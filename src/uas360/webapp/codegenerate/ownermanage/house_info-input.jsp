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
                          <label class="col-lg-2 control-label" for="code-areano">小区编号:</label>
                          <div class="col-lg-3">   <input id="code-areano" type="text" name="areano" value="${model.areano}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-houseid">楼栋编号:</label>
                          <div class="col-lg-3">   <input id="code-houseid" type="text" name="houseid" value="${model.houseid}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-housename">楼栋名:</label>
                          <div class="col-lg-3">   <input id="code-housename" type="text" name="housename" value="${model.housename}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-buildstarttime">开工时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    
                          <input id="code-buildstarttime" type="text" name="buildstarttime" value="${model.buildstarttime}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-buildendtime">竣工时间:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-buildendtime" type="text" name="buildendtime" value="${model.buildendtime}" class="text required" readonly >  </span>  </div></div>
                          
                          <label class="col-lg-2 control-label" for="code-entrancedate">入户日期:</label>
                          <div class="col-lg-3">  <div class="input-append datepicker date">  <span class="add-on">    <input id="code-entrancedate" type="text" name="entrancedate" value="${model.entrancedate}" class="text required" readonly >  </span>  </div></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-housearea">建筑面积:</label>
                          <div class="col-lg-3">  <input id="code-housearea" type="text" name="housearea" value="${model.housearea}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-usearea">使用面积:</label>
                          <div class="col-lg-3">   <input id="code-usearea" type="text" name="usearea" value="${model.usearea}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-afforestedarea">绿化面积:</label>
                          <div class="col-lg-3">   <input id="code-afforestedarea" type="text" name="afforestedarea" value="${model.afforestedarea}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-developers">开发商:</label>
                          <div class="col-lg-3">   <input id="code-developers" type="text" name="developers" value="${model.developers}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-constructionunit">施工单位:</label>
                          <div class="col-lg-3">   <input id="code-constructionunit" type="text" name="constructionunit" value="${model.constructionunit}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-buildinghigh">楼高:</label>
                          <div class="col-lg-3">   <input id="code-buildinghigh" type="text" name="buildinghigh" value="${model.buildinghigh}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-buildingfloor">楼层:</label>
                          <div class="col-lg-3">   <input id="code-buildingfloor" type="text" name="buildingfloor" value="${model.buildingfloor}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-buildingstructure">楼结构:</label>
                          <div class="col-lg-3">   <input id="code-buildingstructure" type="text" name="buildingstructure" value="${model.buildingstructure}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-userstate">用途:</label>
                          <div class="col-lg-3">   <input id="code-userstate" type="text" name="userstate" value="${model.userstate}" class="text required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-totalrooms">总房间数:</label>
                          <div class="col-lg-3">   <input id="code-totalrooms" type="text" name="totalrooms" value="${model.totalrooms}" class="text required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-soldnum">已售套数:</label>
                          <div class="col-lg-3">  <input id="code-soldnum" type="text" name="soldnum" value="${model.soldnum}" class="text number required" ></div>
                          
                          <label class="col-lg-2 control-label" for="code-rentnum">已租套数:</label>
                          <div class="col-lg-3">  <input id="code-rentnum" type="text" name="rentnum" value="${model.rentnum}" class="text number required" ></div>
                          
                            </div>
                          <div class="form-group">
                          <label class="col-lg-2 control-label" for="code-housebug">漏洞信息:</label>
                          <div class="col-lg-6">    <textarea class="form-control required" id="code-housebug" name="housebug" rows="1" >${model.housebug}</textarea></div>
                          
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
