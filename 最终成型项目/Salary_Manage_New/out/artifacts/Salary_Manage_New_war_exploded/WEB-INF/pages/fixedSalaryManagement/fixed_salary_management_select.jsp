<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- 2019/10/12 -->
<!-- 第一次處理 -->
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DHC工资管理系统 | 固定项目管理</title>

<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/static/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css"
	rel="stylesheet">

<!-- Sweet Alert -->
<link
	href="${pageContext.request.contextPath}/static/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">

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
						<li><a
							href="${pageContext.request.contextPath }/login/list?main">Home</a>
						</li>
						<li class="active"><strong>工资项目管理</strong></li>
					</ol>
				</div>
			</div>



			<form action="${pageContext.request.contextPath}/fixed/list"
				method="get">
				<div class="wrapper wrapper-content  animated fadeInRight article">
					<div class="row">
						<div class="col-lg-10 col-lg-offset-1">
							<div class="ibox">
								<div class="ibox-content">
									<!--内容增加区域-->
									<h3>请输入部门编号或部门名称：</h3>
									<div class="input-group">
										<select class="form-control" id="selective" name="selective">
											<option value="">请选择</option>
											<c:forEach items="${requestScope.listDepartments }"
												var="department">
												<option value="${department.departmentId }">${department.departmentName }</option>
											</c:forEach>
										</select> <span class="input-group-btn">
											<button type="submit" class="btn btn-primary" id="go_submit">查询</button>
										</span>
									</div>

									<br />
									<hr />
									<br />

									<h3>进行固定工资的批量导入：</h3>

									<div class="input-group">
										<input type="file" class="form-control" id="fileName" value=""
											placeholder="选择文件"> <span class="input-group-btn">
											<button type="button" class="btn btn-primary"
												onclick="submitFile();">从Excel读取数据</button>
										</span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>

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
	</div>
	</div>

	<!-- Mainly scripts -->
	<script
		src="${pageContext.request.contextPath}/static/js/jquery-2.1.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="${pageContext.request.contextPath}/static/js/inspinia.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/plugins/pace/pace.min.js"></script>

	<!-- Sweet alert -->
	<script
		src="${pageContext.request.contextPath}/static/js/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
		$('body.canvas-menu .sidebar-collapse').slimScroll({
			height : '100%',
			railOpacity : 0.9
		});
		$(function() {
			$("#go_submit").click(function() {
				/*						window.alert("test");*/
				var a = document.getElementById("selective").value;
				if (a == "" || a == null) {
					swal({
						title : "部门名称或编号不能为空!",
						text : "请输入部门编号或名称",
						type : "warning"
					});
					return false;
				}
			});
		});
	</script>
	<!-- 单向员工固定工资修改弹窗 -->
	<c:if test="${not empty updateFsResult}">
		<c:if test="${requestScope.updateFsResult == 1}">
			<script type="text/javascript">
				/* window.alert("${requestScope.updateFsResult == 1}") */
				swal({
					title : "修改员工固定工资成功！",
					text : "已确认数据正确",
					type : "success"
				});
			</script>
		</c:if>
		<c:if test="${requestScope.updateFsResult == 0}">
			<script type="text/javascript">
				window.alert("${requestScope.updateFsResult}")
				swal({
					title : "修改员工固定工资失败！",
					text : "请检查数据是否正确",
					type : "warning"
				});
			</script>
		</c:if>
	</c:if>
	<!-- 批量员工固定工资修改弹窗 -->
	<c:if test="${not empty batchUpdateResult}">
		<c:if test="${requestScope.batchUpdateResult == 1}">
			<script type="text/javascript">
				/* window.alert("${requestScope.updateFsResult == 1}") */
				swal({
					title : "批量修改员工固定工资成功！",
					text : "已确认数据正确",
					type : "success"
				});
			</script>
		</c:if>
		<c:if test="${requestScope.batchUpdateResult == 0}">
			<script type="text/javascript">
				window.alert("${requestScope.updateFsResult}")
				swal({
					title : "批量修改员工固定工资失败！",
					text : "请检查数据是否正确",
					type : "warning"
				});
			</script>
		</c:if>
	</c:if>

	<script type="text/javascript">
		function submitFile() {
			var formData = new FormData();
			var name = $("#fileName").val();
			if ($("#fileName").val() == '') {
				swal({
					title : "警示",
					text : "请选择文件.",
					type : "warning"
				});
				$("#fileName").focus();
				return;
			}
			formData.append("file", $("#fileName")[0].files[0]);
			formData.append("name", name);
			$
					.ajax({
						url : "http://localhost:8888/${pageContext.request.contextPath }/excel/fixedSalary",
						type : "POST",
						async : false,
						data : formData,
						processData : false,
						contentType : false,
						beforeSend : function() {
							console.log("正在进行，请稍候");
						},
						success : function(e) {
							if (e == "01") {
								swal({
					                title: "导入成功",
					                text: "已确认数据正确",
					                type: "success"
					            });
							} else {
								swal({
					                title: "导入失败",
					                text: "请检查数据是否正确",
					                type: "warning"
					            });
							}
						}
					});
		}
	</script>
</body>

</html>