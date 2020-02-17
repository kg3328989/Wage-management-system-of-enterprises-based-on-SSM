<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DHC工资管理系统 | 工资结算</title>

<link
	href="${pageContext.request.contextPath }/static/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/static/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/static/css/plugins/chosen/chosen.css"
	rel="stylesheet">
<link 
	href="${pageContext.request.contextPath }/static/css/plugins/sweetalert/sweetalert.css" 
	rel="stylesheet">

</head>

<body>

	<div id="wrapper">

		<%@include file="../inc/menu.jsp"%>

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
						<li><a href="${pageContext.request.contextPath }/login/list?main">Home</a></li>
						<li class="active"><a
							href="${pageContext.request.contextPath }/salarysettlement/list?form"><strong>工资结算管理</strong></a>
						</li>
						<li class="active"><a
							href="#"><strong>工资结算详细</strong></a>
						</li>
					</ol>
				</div>
			</div>

			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="ibox">
							<div class="ibox-title">
								<h5>
									员工工资详细<small></small>
								</h5>
							</div>
							<div class="ibox-content">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>项目名称</th>
											<th>金额</th>
											<th>增减项</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach
											items="${requestScope.listSalarySettlementDetails }"
											var="salarySettlementDetails" varStatus="ind">
											<tr>
												<td>${ind.count }</td>
												<td>${salarySettlementDetails.projectName }</td>
												<td>${salarySettlementDetails.money }</td>
												<td><c:if
														test="${salarySettlementDetails.addorsubtract eq 0 }">+</c:if>
													<c:if
														test="${salarySettlementDetails.addorsubtract eq 1  }">-</c:if>
												</td>

											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<form
												action="${pageContext.request.contextPath }/salarysettlement/list?form"
												method="post">
												<td>&nbsp</td>
												<td>总计</td>
												<td>${requestScope.salarySum }</td>
												<td><button type="submit" class="btn btn-primary btn-sm demo1">返回</button></td>
											</form>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--åºé¨æ¾ç¤º-->
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

	<!-- Mainly scripts -->
	<script
		src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="${pageContext.request.contextPath }/static/js/inspinia.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/plugins/pace/pace.min.js"></script>
	<script 
		src="${pageContext.request.contextPath }/static/js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script>
		//预加载，判断员工工资状态
		$(document).ready(function() {
			var state = ${ requestScope.salaryState };
			if (state == 1) {
				$("#trueSalary").prop("disabled", "disabled");
				$("#sumbitBtn").prop("disabled", "disabled");
			}
		});
	</script>

</body>

</html>
