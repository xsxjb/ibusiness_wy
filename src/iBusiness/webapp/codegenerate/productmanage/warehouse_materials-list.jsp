<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>物料库存管理列表</title>
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
	        exportUrl: 'warehouse_materials-export.do'
		};

		var table;
		$(function() {
			table = new Table(config);
		    table.configPagination('.m-pagination');
		    table.configPageInfo('.m-page-info');
		    table.configPageSize('.m-page-size');
		});
		
    </script>
  </head>

  <body>
    <%@include file="/ibusiness/header/header-portal.jsp"%>
    <div class="row">
    <div class="col-lg-1"></div>
	<!-- start of main -->
	<div class="panel panel-default col-lg-10">
	<!-- 查询条件 -->
        <div class="panel-heading"><h4 class="panel-title">查询</h4></div>
          <div class="panel-body">
	          <div id="search" class="content content-inner">
				  <form name="cgForm" method="post" action="warehouse_materials-list.do" class="form-inline">
				    <div class="form-group">
				                <label for="code_table_materialname">物料名称:</label>
				                <input type="text" id="code_table_materialname" name="filter_LIKES_materialname" value="${param.filter_LIKES_materialname}">
					    <button class="btn btn-default btn-sm" onclick="document.cgForm.submit()">查询</button>
					</div>
				 </form>
			  </div>
		  </div>
	   <div class="panel-heading"><h4 class="panel-title">物料库存管理列表</h4></div>
       <div class="panel-body">
		    <div class="pull-left">
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
			<form id="gridForm" name="gridForm" method='post' action="warehouse_materials-remove.do" class="m-form-blank">
			  <table id="codeGrid" class="table table-hover table-bordered">
			      <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
					                <th class="sorting">物料分类编号</th>
					                <th class="sorting">物料编号</th>
					                <th class="sorting">物料名称</th>
					                <th class="sorting">规格型号</th>
					                <th class="sorting">价格</th>
					                <th class="sorting">单位</th>
					                <th class="sorting">数量</th>
					                <th class="sorting">仓库名称</th>
				      </tr>
				    </thead>
					    <tbody>
					      <c:forEach items="${page.result}" var="item">
					      <tr>
					        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
						            <td>${item.materialtypeno}</td>
						            <td>${item.materialno}</td>
						            <td>${item.materialname}</td>
						            <td>${item.materialmodel}</td>
						            <td>${item.materialprice}</td>
						            <td>${item.materialunit}</td>
						            <td>${item.materialnum}</td>
						            <td>${item.warehousename}</td>
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
