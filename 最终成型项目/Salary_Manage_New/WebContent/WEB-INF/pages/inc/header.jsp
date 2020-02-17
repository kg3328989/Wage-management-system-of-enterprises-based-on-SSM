<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-static-top  " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
			href="#"><i class="fa fa-bars"></i> </a>
		<form role="search" class="navbar-form-custom"
			action="search_results.html">
			<div class="form-group">
				<input type="text" placeholder="Menu" class="form-control"
					name="top-search" id="top-search" disabled="disabled">
			</div>
		</form>
	</div>
	<ul class="nav navbar-top-links navbar-right">
		<li><span class="m-r-sm text-muted welcome-message">工资管理系统</span>
		</li>
		<li class="dropdown"><a class="dropdown-toggle count-info"
			data-toggle="dropdown" href="main.html#"> <i class="fa fa-bell"></i>
				<span>管理员${sessionScope.userName }</span>
		</a></li>

		<li><a href="${pageContext.request.contextPath }/login/list?form"> <i class="fa fa-sign-out"></i> 退出
		</a></li>
	</ul>

</nav>