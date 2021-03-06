<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>材料采购计划申请表编辑</title>
    <%@include file="/common/center.jsp"%>
    <script type="text/javascript">
		var config = {
		    id: 'codeGrid',
		    pageNo: ${page.pageNo},
		    pageSize: ${page.pageSize},
		    totalCount:${page.totalCount},
		    resultSize: ${page.resultSize},
		    pageCount: ${page.pageCount},
		    orderBy: '${page.orderBy == null ? '' : page.orderBy}',
		    asc: ${page.asc},
		    params: {
		        'id': '${model.id}',
		        'flowId':'${flowId}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
			,exportUrl: 'material_buy_plan-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
		// 提交方法--通过传入路径 提交到不同的controller
		function mainFormSubmit(path){
			$('#mainForm').attr('action', path).submit();
		}
		
		// 表单验证JS
		$(function() {
		    $("#mainForm").validate({
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
  </head>
  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
	<div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10"> 
	    <div class="panel-heading"><h4 class="panel-title">材料采购计划申请表流程控制</h4></div>
	    <div class="panel-body">
	        <div class="pull-left">
	            <a href="#nextTaskUserDiv" role="button" class="btn btn-default btn-sm" data-toggle="modal">办理</a>
			    <button class="btn btn-default btn-sm a-submit" onclick="mainFormSubmit('buy_plan-save-draft.do')">草稿</button>
			    <button class="btn btn-default btn-sm" onclick="location.href='buy_plan-rollback.do?executionId=${model.executionid}&flowId=${flowId}&flowType=0'">回退</button>
			    <button class="btn btn-default btn-sm a-remove" onclick="location.href='buy_plan-list.do?flowId=${flowId}&flowType=0'">返回</button>
			</div>
	   </div>
	   
        <div class="panel-heading"><h4 class="panel-title">流程内容</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="buy_plan-complete.do" class="form-horizontal">
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				       <input type="hidden" name="executionid" value="${model.executionid}">
				       <input type="hidden" name="createdatebpm" value="${model.createdatebpm}">
				       <input type="hidden" name="assigneeuser" value="${model.assigneeuser}">
				       <input type="hidden" name="nodename" value="${model.nodename}">
				       <input type="hidden" name="doneflag" value="${model.doneflag}">
				   </c:if>
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-projectno">项目编号:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectno.fcEdit=='1'}">    <input id="code-projectno" type="text" name="projectno" value="${model.projectno}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectno.fcEdit!='1'}">    <label>${model.projectno}</label>    <input type="hidden" name="projectno" value="${model.projectno}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-projectname">项目名称:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.projectname.fcEdit=='1'}">    <input id="code-projectname" type="text" name="projectname" value="${model.projectname}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.projectname.fcEdit!='1'}">    <label>${model.projectname}</label>    <input type="hidden" name="projectname" value="${model.projectname}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-productmanage">项目负责人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.productmanage.fcEdit=='1'}">    <input id="code-productmanage" type="text" name="productmanage" value="${model.productmanage}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.productmanage.fcEdit!='1'}">    <label>${model.productmanage}</label>    <input type="hidden" name="productmanage" value="${model.productmanage}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-eventdate">日期:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.eventdate.fcEdit=='1'}">    <input id="code-eventdate" type="text" name="eventdate" value="${model.eventdate}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.eventdate.fcEdit!='1'}">    <label>${model.eventdate}</label>    <input type="hidden" name="eventdate" value="${model.eventdate}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-buyer">采购员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.buyer.fcEdit=='1'}">    <input id="code-buyer" type="text" name="buyer" value="${model.buyer}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.buyer.fcEdit!='1'}">    <label>${model.buyer}</label>    <input type="hidden" name="buyer" value="${model.buyer}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-applicant">申请人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.applicant.fcEdit=='1'}">    <input id="code-applicant" type="text" name="applicant" value="${model.applicant}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.applicant.fcEdit!='1'}">    <label>${model.applicant}</label>    <input type="hidden" name="applicant" value="${model.applicant}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-receiptuser">收货人:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.receiptuser.fcEdit=='1'}">    <input id="code-receiptuser" type="text" name="receiptuser" value="${model.receiptuser}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.receiptuser.fcEdit!='1'}">    <label>${model.receiptuser}</label>    <input type="hidden" name="receiptuser" value="${model.receiptuser}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-receiptaddress">收货地址:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.receiptaddress.fcEdit=='1'}">    <input id="code-receiptaddress" type="text" name="receiptaddress" value="${model.receiptaddress}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.receiptaddress.fcEdit!='1'}">    <label>${model.receiptaddress}</label>    <input type="hidden" name="receiptaddress" value="${model.receiptaddress}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-stocktype">备货类型:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.stocktype.fcEdit=='1'}">    <input id="code-stocktype" type="text" name="stocktype" value="${model.stocktype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.stocktype.fcEdit!='1'}">    <label>${model.stocktype}</label>    <input type="hidden" name="stocktype" value="${model.stocktype}">  </c:if></div>
	                                      
						 
						      <label class="control-label  col-lg-2" for="code-documenttype">单据来源:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.documenttype.fcEdit=='1'}">    <input id="code-documenttype" type="text" name="documenttype" value="${model.documenttype}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.documenttype.fcEdit!='1'}">    <label>${model.documenttype}</label>    <input type="hidden" name="documenttype" value="${model.documenttype}">  </c:if></div>
	                                      
                            </div>
						 
                           <div class="form-group">
						      <label class="control-label  col-lg-2" for="code-planner">计划员:</label>
                              <div class="col-lg-3">  <c:if test="${nodeColumsMap.planner.fcEdit=='1'}">    <input id="code-planner" type="text" name="planner" value="${model.planner}" class="text required" >  </c:if>  <c:if test="${nodeColumsMap.planner.fcEdit!='1'}">    <label>${model.planner}</label>    <input type="hidden" name="planner" value="${model.planner}">  </c:if></div>
	                                      
						 
					
					<!--  选择下一节点办理人弹出层  -->
				    <div id="nextTaskUserDiv" class="modal fade" tabindex="-1" style="top:20%;" >
				            <div class="modal-dialog">
						    <div class="modal-content">
							      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal"><span >&times;</span><span class="sr-only">Close</span></button>
								        <h4 class="modal-title">办理下一节点</h4>
							      </div>
							      <div class="modal-body">
									    <div class="form-group">
                                            <label class="col-lg-2 control-label" for="code-remark">办理人:</label>
                                            <div class="col-lg-4">
												  <select id="code-sex" name="userId" class="form-control">
												        <option value="" >请选择</option>
													  <c:forEach items="${userItems}" var="item">
													    <option value="${item.id}"  ${item.id == userId ? 'selected' : ''}>${item.displayName}</option>
													  </c:forEach>
												  </select>
										      </div>
						                </div>
						           </div>
						           <div class="modal-footer">
						                    <button class="btn btn-default btn-sm a-insert">办理</button>
						                    <button class="btn btn-default btn-sm" data-dismiss="modal" >关闭</button>
						           </div>
					            </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
				    </div>
					
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='material_buy_plan-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
				    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
	            
				</div>
				<div class="pull-right">
				  每页显示
				  <select class="m-page-size">
				    <option value="10">10</option>
				    <option value="20">20</option>
				    <option value="50">50</option>
				  </select>
				  条
				</div>
			    <div class="m-clear"></div>
		   </div>
		   <div class="content">
				<form id="gridForm" name="gridForm" method='post' action="material_buy_plan-remove.do" class="m-form-blank">
				  <input type="hidden" name="flowId" value="${flowId}">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					          <th width="80">&nbsp;</th>
		                      <th class="sorting">原料编号</th>
		                      <th class="sorting">原料名称</th>
		                      <th class="sorting">规格型号</th>
		                      <th class="sorting">数量</th>
		                      <th class="sorting">交货日期</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									    <td>
								            <a href="material_buy_plan-input.do?id=${model.id}&subId=${item.id}&flowId=${flowId}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
							            <td>${item.materialno}</td>
							            <td>${item.materialname}</td>
							            <td>${item.model}</td>
							            <td>${item.materialnum}</td>
							            <td>${item.deliverydate}</td>
								  </tr>
						      </c:forEach>
						    </tbody>
						  </table>
						</form>
		        </div>
			  <article>
			    <div class="m-page-info pull-left">
				  共100条记录 显示1到10条记录
				</div>
				<div class="btn-group m-pagination pull-right">
				  <button class="btn btn-small">&lt;</button>
				  <button class="btn btn-small">1</button>
				  <button class="btn btn-small">&gt;</button>
				</div>
			    <div class="m-clear"></div>
		      </article>
      </div>
	<!-- end of main -->
	</div>
  </body>
</html>
