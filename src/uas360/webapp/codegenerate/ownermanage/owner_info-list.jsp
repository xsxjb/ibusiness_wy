<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>业主信息列表</title>
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
			gridFormId: 'gridForm'
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
    <div class="span2"></div>
	<!-- start of main -->
	<div class="panel panel-default col-md-10 ">
	    <!-- 查询条件 -->
	          <div class="panel-heading"><h4 class="panel-title">查询</h4></div>
	          <div class="panel-body">
		          <div id="search" class="content content-inner">
					  <form name="cgForm" method="post" action="owner_info-list.do" class="form-inline">
					    <div class="form-group">
					                <label for="code_table_ownername">业主姓名:</label>
					                <input type="text" id="code_table_ownername" name="filter_LIKES_ownername" value="${param.filter_LIKES_ownername}">
						    <button class="btn btn-default btn-sm" onclick="document.cgForm.submit()">查询</button>
						</div>
					 </form>
				  </div>
			  </div>
		      <div class="panel-heading"><h4 class="panel-title">业主信息列表</h4></div>
		      <div class="panel-body">
				    <div class="pull-left">
					    <button class="btn btn-default btn-sm a-insert" onclick="location.href='owner_info-input.do?flowId=${flowId}'">新建</button>
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
					<form id="gridForm" name="gridForm" method='post' action="owner_info-remove.do" class="m-form-blank">
					  <table id="codeGrid" class="table table-hover table-bordered">
					      <thead>
						      <tr>
						          <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
				                          <th class="sorting">业主编号</th>
				                          <th class="sorting">业主姓名</th>
				                          <th class="sorting">业主的年龄</th>
				                          <th class="sorting">业主所属楼栋</th>
				                          <th class="sorting">业主房间号</th>
				                          <th class="sorting">业主身份证号</th>
				                          <th class="sorting">业主联系电话</th>
						          <th width="60">&nbsp;</th>
						      </tr>
						    </thead>
							    <tbody>
							      <c:forEach items="${page.result}" var="item">
							      <tr>
							        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
				                            <td>${item.ownerid}</td>
				                            <td>${item.ownername}</td>
				                            <td>${item.ownerage}</td>
				                            <td>${item.houseid}</td>
				                            <td>${item.roomid}</td>
				                            <td>${item.owneridcard}</td>
				                            <td>${item.ownertel}</td>
							        <td>
							          <a href="owner_info-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
			  
	    </div>
	<!-- end of main -->
	</div>
  </body>
</html>
