<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>供应商管理列表</title>
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
		        'filter_LIKES_id': '${param.filter_LIKES_id}'
		    },
			selectedItemClass: 'selectedItem',
			gridFormId: 'gridForm',
	        exportUrl: 'supplier-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
		
		// 导入excel
		function importExcel(){
			 $("#msgInfoForm").submit();
		}
    </script>
  </head>

  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10">
	<!-- 查询条件 -->
	   <div class="panel-heading"><h4 class="panel-title">供应商管理列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
			    <button class="btn btn-default btn-sm a-insert" onclick="location.href='supplier-input.do'">新建</button>
			    <button class="btn btn-default btn-sm a-remove" onclick="table.removeAll()">删除</button>
			    <button class="btn btn-default btn-sm"  onclick="importExcelAdd.click()">导入Excel</button>
			    <form id="msgInfoForm" method="post" action="supplier-importExcel.do" class="form-horizontal" enctype="multipart/form-data">
                    <input id="importExcelAdd" type="file" name="attachment"  style="display:none;" onChange="importExcel()"> 
                </form>
            
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
			<form id="gridForm" name="gridForm" method='post' action="supplier-remove.do" class="m-form-blank">
			  <table id="codeGrid" class="table table-hover table-bordered">
			      <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                <th class="sorting">填表人</th>
					                <th class="sorting">供应商编号</th>
					                <th class="sorting">企业名称</th>
					                <th class="sorting">企业地址</th>
					                <th class="sorting">网址</th>
					                <th class="sorting">公司电话</th>
				        <th width="80">&nbsp;</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${page.result}" var="item">
					      <tr>
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
						            <td>${item.information}</td>
						            <td>${item.suppliernumber}</td>
						            <td>${item.unitname}</td>
						            <td>${item.useraddress}</td>
						            <td>${item.url}</td>
						            <td>${item.companyphone}</td>
					        <td>
					          <a href="supplier-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
