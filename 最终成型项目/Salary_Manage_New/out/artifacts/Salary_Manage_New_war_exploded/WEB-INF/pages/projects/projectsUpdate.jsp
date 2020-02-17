<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DHC工资管理系统 | 工资项目管理</title>

<link
	href="${pageContext.request.contextPath }/static/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/static/css/plugins/dataTables/datatables.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/static/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/style.css"
	rel="stylesheet">

<!-- Sweet Alert -->
<link
	href="${pageContext.request.contextPath }/static/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
</head>

<body>

	<div id="wrapper">


		<!--右侧菜单开始-->
		<%@ include file="../inc/menu.jsp"%>
		<!--右侧菜单开结束-->

		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<!--上侧导航条开始-->
				<%@ include file="../inc/header.jsp"%>
				<!--上侧导航条结束-->
			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-4">
					<h2>DHC工资管理系统</h2>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath }/login/list?main">Home</a></li>
						<li class="active"><strong>工资项目修改</strong></li>
					</ol>
				</div>
			</div>

			<div class="row text-center">


			</div>

			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="ibox">
							<!--内容增加区域-->
							<div class="ibox-title">
								<h5>
									工资项目修改 <small>(请填写相应信息)</small>
								</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content">
								<form id="form" method="post"
									action="${pageContext.request.contextPath}/projects/${projects.projectId}/update?update"
									class="form-horizontal">
									<div class="form-group">
										<label class="col-sm-3 control-label">项目名称</label>

										<div class="col-sm-5">
											<input type="hidden" name="projectId" id="projectId"
												value="${projects.projectId}" class="form-control">
											<input type="text" name="projectName" id="projectName"
												value="${projects.projectName}" class="form-control">
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label">项目类型</label>
										<div class="col-sm-5">
											<input type="hidden" name="calculationId" id="calculationId"
												class="form-control" value="${projects.calculationId}">
											<input type="hidden" name="projectType" id="projectType"
												class="form-control" value="${projects.projectType}">
											<c:forEach items="${salaryProjectsList}" var="salaryProjects">
												<c:if
													test="${salaryProjects.salaryProjectId eq projects.projectType}">
													<input type="text" class="form-control"
														value="${salaryProjects.salaryProjectName}"
														readonly="readonly">
												</c:if>
											</c:forEach>
											<span class="help-block m-b-none"></span>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-3 control-label">是否显示<br />在工资条中
										</label>

										<div class="col-sm-5">
											<div class="i-checks">
												<label> <input type="radio" checked="checked"
													value="1" name="show"> <i></i> 在工资条中显示
												</label>
											</div>
											<div class="i-checks">
												<label> <input type="radio" value="0" name="show">
													<i></i> 不在在工资条中显示
												</label>
											</div>
										</div>
									</div>
									<div class="hr-line-dashed"></div>


									<div class="form-group">
										<label class="col-sm-3 control-label">增减项</label>
										<div class="col-sm-5">
											<select class="form-control m-b" name="addorsubtract"
												id="addorsubtract">
												<c:forEach items="${addorsubtractMap.keySet()}" var="key">
													<c:if test="${key eq projects.addorsubtract}">
														<option value="${key}" selected="selected">${addorsubtractMap.get(key)}</option>
													</c:if>
													<c:if test="${key ne projects.addorsubtract}">
														<option value="${key}">${addorsubtractMap.get(key)}</option>
													</c:if>
												</c:forEach>
											</select> <span class="help-block m-b-none"></span>
										</div>
									</div>

									<div class="hr-line-dashed"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label">备注</label>
										<div class="col-sm-5">
											<input type="text" name="remark" id="remark"
												value="${projects.remark}" class="form-control"> <span
												class="help-block m-b-none"></span>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group">
										<label class="col-sm-7 control-label"></label>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="reset">重置</button>
											<button class="btn btn-primary" type="button" onclick="one()">保存</button>
										</div>
									</div>

								</form>

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
	</div>




	<!-- projectsAddAddAddly scripts -->
	<script
		src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.js "></script>
	<script
		src="${pageContext.request.contextPath }/static/js/bootstrap.min.js "></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/metisMenu/jquery.metisMenu.js "></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/slimscroll/jquery.slimscroll.min.js "></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/jeditable/jquery.jeditable.js "></script>

	<script
		src="${pageContext.request.contextPath }/static/js/plugins/dataTables/datatables.min.js "></script>

	<!-- Custom and plugin javascript -->
	<script
		src="${pageContext.request.contextPath }/static/js/inspinia.js "></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/pace/pace.min.js "></script>


	<!-- Sweet alert -->
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
		$('body.canvas-menu .sidebar-collapse').slimScroll({
			height : '100%',
			railOpacity : 0.9
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {

							$('.demo1')
									.click(
											function() {
												swal({
													title : "Welcome in Alerts",
													text : "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
												});
											});

							$('.demo2').click(function() {
								swal({
									title : "Good job!",
									text : "You clicked the button!",
									type : "success"
								});
							});

							$('.demo3')
									.click(
											function() {
												swal(
														{
															title : "Are you sure?",
															text : "You will not be able to recover this imaginary file!",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, delete it!",
															closeOnConfirm : false
														},
														function() {
															swal(
																	"Deleted!",
																	"Your imaginary file has been deleted.",
																	"success");
														});
											});

							$('.demo4')
									.click(
											function() {
												swal(
														{
															title : "Are you sure?",
															text : "Your will not be able to recover this imaginary file!",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, delete it!",
															cancelButtonText : "No, cancel plx!",
															closeOnConfirm : false,
															closeOnCancel : false
														},
														function(isConfirm) {
															if (isConfirm) {
																swal(
																		"Deleted!",
																		"Your imaginary file has been deleted.",
																		"success");
															} else {
																swal(
																		"Cancelled",
																		"Your imaginary file is safe :)",
																		"error");
															}
														});
											});

						});
	</script>
	<script type="text/javascript">
		function one() {
			if ($("#projectName").val() == "" || $("#projectName").val().length>255) {
				swal({
					title : "项目名称不能为空且长度不能超过255!",
					text : "请输入项目名称! 如:基本工资，病假，事假..."
				});
				return;
			}
			if ($("#remark").val().length>255) {
				swal({
					title : "备注长度不能超过255!",
					text : "请输入正确的备注信息!"
				});
				return;
			}
			if (!(/^[^\s\., 。 !@#$%^&*()]+$/).test($("#projectName").val())) {
				swal({
	                title: "项目名称不能包含空格!@#$%^&*()。等特殊字符!",
	                text: "请输入项目名称! 如:基本工资，病假，事假..."
	            });
				return;
			}
			if (!(/^[^\s\., 。 !@#$%^&*()]+$/).test($("#remark").val()) && $("#remark").val()!="") {
				swal({
	                title: "备注不能包含空格!@#$%^&*()。等特殊字符s!",
	                text: "请输入正确的备注信息!"
	            });
				return;
			}
			
			$('#form').submit();
		}
	</script>

</body>

</html>