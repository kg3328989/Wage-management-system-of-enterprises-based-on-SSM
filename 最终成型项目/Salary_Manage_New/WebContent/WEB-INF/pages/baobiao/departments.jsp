<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DHC工资管理系统 | 报表管理</title>

<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">


</head>

<body>

	<div id="wrapper">

		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<a class="close-canvas-menu"><i class="fa fa-times"></i></a>
				<!--右侧菜单开始-->
				<%@include file="../inc/menu.jsp"%>
				<!--右侧菜单开结束-->
			</div>
		</nav>

		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<!--上侧导航条开始-->
				<%@include file="../inc/header.jsp"%>
				<!--上侧导航条结束-->
			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-4">
					<h2>DHC工资管理系统</h2>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath }/login/list?form">Home</a></li>
						<li class="active"><strong>/部门查询</strong></li>
					</ol>
				</div>
			</div>

			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row">
					<div class="col-lg-20 col-lg-offset-1">
						<div class="ibox">

							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">部门年度/月度工资统计</h3>
									</div>
									<div class="panel-body">
										<form class="form-horizontal" method="post"
											action="${pageContext.request.contextPath}/baobiao/listDepartments">
											<div class="form-group">
												<label for="inputPassword3" class="col-sm-2 control-label">部门名称</label>
												<div class="col-sm-10">
													<select class="select2_demo_1 form-control "
														id="departmentId" name="departmentId">
														<option value="">请选择...</option>
														<c:forEach items="${requestScope.deptList}"
															var="departments">
															<option value="${departments.departmentId}">${departments.departmentName}</option>
														</c:forEach>
													</select> <br />
												</div>


											</div>
											<div class="form-group" id="data_4">
												<label for="departmentName" class="col-sm-2 control-label">选择日期</label>
												<div class="input-group date">
													<span class="input-group-addon"> <i
														class="fa fa-calendar"></i>
													</span> <input type="text" class="form-control"
														readonly="readonly" name="importDate" id="date1">

												</div>
											</div>
											<div class="text-right">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="submit" class="btn btn-default">查询</button>
												</div>
											</div>

										</form>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">查询结果</h3>
										</div>
										<c:if test="${empty requestScope.salarySettlementsDateList}">

											<tr>无查询结果。
											</tr>
										</c:if>
										<c:if test="${not empty requestScope.DateDepartmentsList}">
											<div class="panel-body">
												<table
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>部门编号</th>
															<th>年度/月度</th>
															<th>部门名称</th>
															<th>总工资</th>
															<th>最高工资</th>
															<th>最低工资</th>
															<th>平均工资</th>

														</tr>
													</thead>
													<tbody>

														<c:forEach items="${DateDepartmentsList}"
															var="DateDepartments">
															<c:if test="${DateDepartments.sumSalary ne 0}">
																<tr>

																	<td>${DateDepartments.departmentId}</td>
																	<td><fmt:formatDate pattern="yyyy-MM"
																			value="${DateDepartments.importDate}" /></td>
																	<td><c:forEach items="${requestScope.deptList}"
																			var="departments">
																			<c:if
																				test="${ departments.departmentId eq DateDepartments.departmentId}">
																			${ departments.departmentName}</c:if>
																		</c:forEach></td>
																	<td>${DateDepartments.sumSalary}</td>
																	<td>${DateDepartments.maxSalary}</td>
																	<td>${DateDepartments.minSalary}</td>
																	<td>${(DateDepartments.sumSalary)/(DateDepartments.avgSalary)}</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</c:if>

									</div>

								</div>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
		<!--底部显示-->
		<div class="footer">
			<div class="pull-right">
				<strong>大连华信培训中心定制二班</strong>第五组
			</div>
			<div>
				<strong>Web</strong> for DHC &copy; 2019-2020
			</div>
		</div>

	</div>

	<!-- Mainly scripts -->
	<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/plugins/jeditable/jquery.jeditable.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/plugins/dataTables/datatables.min.js"></script>

	<!-- Data picker -->
	<script src="${pageContext.request.contextPath}/static/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- Custom and plugin javascript -->
	<script src="${pageContext.request.contextPath}/static/js/inspinia.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/plugins/pace/pace.min.js"></script>
	<!-- Page-Level Scripts -->
	<script>
		$(document)
				.ready(
						function() {
							$('.dataTables-example')
									.DataTable(
											{
												dom : '<"html5buttons"B>lTfgitp',
												buttons : [
														{
															extend : 'copy'
														},
														{
															extend : 'csv'
														},
														{
															extend : 'excel',
															title : 'ExampleFile'
														},
														{
															extend : 'pdf',
															title : 'ExampleFile'
														},

														{
															extend : 'print',
															customize : function(
																	win) {
																$(
																		win.document.body)
																		.addClass(
																				'white-bg');
																$(
																		win.document.body)
																		.css(
																				'font-size',
																				'10px');

																$(
																		win.document.body)
																		.find(
																				'table')
																		.addClass(
																				'compact')
																		.css(
																				'font-size',
																				'inherit');
															}
														} ]

											});
							/* Init DataTables */
							var oTable = $('#editable').DataTable();

							/* Apply the jEditable handlers to the table */
							oTable
									.$('td')
									.editable(
											'../example_ajax.php',
											{
												"callback" : function(sValue, y) {
													var aPos = oTable
															.fnGetPosition(this);
													oTable.fnUpdate(sValue,
															aPos[0], aPos[1]);
												},
												"submitdata" : function(value,
														settings) {
													return {
														"row_id" : this.parentNode
																.getAttribute('id'),
														"column" : oTable
																.fnGetPosition(this)[2]
													};
												},

												"width" : "90%",
												"height" : "100%"
											});

						});

		function fnClickAddRow() {
			$('#editable').dataTable()
					.fnAddData(
							[ "Custom row", "New row", "New row", "New row",
									"New row" ]);

		}
	</script>





	<script>
		$('body.canvas-menu .sidebar-collapse').slimScroll({
			height : '100%',
			railOpacity : 0.9
		});
		$(document).ready(function() {
			$('#data_4 .input-group.date').datepicker({
				minViewMode : 1,
				keyboardNavigation : false,
				forceParse : false,
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>


</body>

</html>