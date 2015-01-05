<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
    <%@include file="/common/meta.jsp"%>
    <title>业主信息编辑</title>
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
		        'id': '${model.id}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm'
			,exportUrl: 'owner_family-export.do'
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
        <div class="panel-heading"><h4 class="panel-title">业主信息流程</h4></div>
        <div class="panel-body">
		<div class="content content-inner">
		       <form id="mainForm" method="post" action="owner_info-save.do" class="form-horizontal">
		           <div class="controls">
					      <button id="submitButton" class="btn btn-default btn-sm a-submit">保存</button>
					      <button type="button" onclick="location.href='owner_info-list.do'" class="btn btn-default btn-sm a-cancel">返回</button>
				   </div>
				   <input type="hidden" name="flowId" value="${flowId}">
				   <c:if test="${model != null}">
				       <input type="hidden" name="id" value="${model.id}">
				   </c:if>
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-ownerid">业主编号:</label>
                               <div class="col-lg-3">   <input id="code-ownerid" type="text" name="ownerid" value="${model.ownerid}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-ownername">业主姓名:</label>
                               <div class="col-lg-3">   <input id="code-ownername" type="text" name="ownername" value="${model.ownername}" class="text required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-ownerloginname">业主登录名:</label>
                               <div class="col-lg-3">   <input id="code-ownerloginname" type="text" name="ownerloginname" value="${model.ownerloginname}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-ownerpassword">业主登录密码:</label>
                               <div class="col-lg-3">   <input id="code-ownerpassword" type="text" name="ownerpassword" value="${model.ownerpassword}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-ownersex">业主的性别:</label>
                               <div class="col-lg-3">    <select id="code-ownersex" name="ownersex" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${ownersexItems}" var="item">          <option value="${item.key}" ${item.key==model.ownersex? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                               
							
						      <label class="control-label col-lg-2" for="code-ownerage">业主的年龄:</label>
                               <div class="col-lg-3">  <input id="code-ownerage" type="text" name="ownerage" value="${model.ownerage}" class="text number required" ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-houseid">业主所属楼栋:</label>
                               <div class="col-lg-3">    <select id="code-houseid" name="houseid" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${houseidItems}" var="item">          <option value="${item.key}" ${item.key==model.houseid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                               
							
						      <label class="control-label col-lg-2" for="code-roomid">业主房间号:</label>
                               <div class="col-lg-3">    <select id="code-roomid" name="roomid" class="form-control required" >          <option value="" >请选择</option>        <c:forEach items="${roomidItems}" var="item">          <option value="${item.key}" ${item.key==model.roomid? 'selected':''} >${item.value}</option>        </c:forEach>    </select></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-owneridcard">业主身份证号:</label>
                               <div class="col-lg-3">   <input id="code-owneridcard" type="text" name="owneridcard" value="${model.owneridcard}" class="text " ></div>
                               
							
						      <label class="control-label col-lg-2" for="code-ownertel">业主联系电话:</label>
                               <div class="col-lg-3">   <input id="code-ownertel" type="text" name="ownertel" value="${model.ownertel}" class="text " ></div>
                               
                            </div>
							
                             <div class="form-group">
						      <label class="control-label col-lg-2" for="code-ownerhomeplace">业主籍贯:</label>
                               <div class="col-lg-3">   <input id="code-ownerhomeplace" type="text" name="ownerhomeplace" value="${model.ownerhomeplace}" class="text " ></div>
                            </div>
						<div class="form-group">
					        <label class="control-label col-lg-2" for="code-ownerworkplace">业主工作地:</label>
                            <div class="col-lg-6">    <textarea class="form-control required" id="code-ownerworkplace" name="ownerworkplace" rows="1" >${model.ownerworkplace}</textarea></div>
                        </div>
				</form>
		</div>
        </div> 
        <!-- ==================== 子表 ========================================== -->
        <div class="panel-heading"><h4 class="panel-title">列表</h4></div>
	    <div class="panel-body">
			    <div class="pull-left">
				    <button class="btn btn-default btn-sm a-insert" onclick="location.href='owner_family-input.do?id=${model.id}&subId=&flowId=${flowId}'">新建</button>
				    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
				    <button class="btn btn-default btn-sm" onclick="table.exportExcel()">导出Excel</button>
	            
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
				<form id="gridForm" name="gridForm" method='post' action="owner_info-remove.do" class="m-form-blank">
				  <table id="codeGrid" class="table table-hover table-bordered">
				      <thead>
					      <tr>
					          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
			                      <th class="sorting">业主编号</th>
			                      <th class="sorting">业主成员编号</th>
			                      <th class="sorting">业主成员姓名</th>
			                      <th class="sorting">业主的性别</th>
			                      <th class="sorting">业主的年龄</th>
			                      <th class="sorting">业主联系电话</th>
			                      <th class="sorting">业主工作地</th>
					          <th width="80">&nbsp;</th>
					      </tr>
					    </thead>
						    <tbody>
						      <c:forEach items="${page.result}" var="item">
								  <tr>
								        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
									            <td>${item.ownerid}</td>
									            <td>${item.ownerfamilyid}</td>
									            <td>${item.ownerfamilyname}</td>
									            <td>${item.ownerfamilysex}</td>
									            <td>${item.ownerfamilyage}</td>
									            <td>${item.ownerfamilytel}</td>
									            <td>${item.ownerfamilyworkplace}</td>
								        <td>
								          <a href="owner_family-input.do?id=${model.id}&subId=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
								        </td>
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
