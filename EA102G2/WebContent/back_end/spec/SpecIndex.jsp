<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/back_end/pageTags.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<title>搜尋規格</title>

<%@ include file="/back_end/headerSection.jsp"%>

<style>
.form-horizontal {
	width: 100%;
}
</style>

</head>

<body class="sticky-header">

	<%@ include file="/back_end/leftSideMenu.jsp"%>

	<!-- main content start-->
	<div class="main-content">

		<%@ include file="/back_end/headerMenu.jsp"%>

		<!--body wrapper start-->
		<div class="wrapper">

			<!--Start Page Title-->
			<div class="page-title-box">
				<h4 class="page-title">規格管理</h4>
				<ol class="breadcrumb">
					<li><a
						href="<%=request.getContextPath()%>/back_end/spec/SpecIndex.jsp">分類規格查詢</a></li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--End Page Title-->
			<!--Start row-->
			<div class="row">
				<div class="col-md-12">

					<div class="white-box">
						<h2 class="header-title">
							<div>分類規格查詢</div>
							<div class="features"></div>
						</h2>
						<div class="table-responsive">
							<c:if test="${not empty errorMsgs}">
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
							<jsp:useBean id="catSvc" scope="page"
								class="com.catagory.model.CatagoryService" />

							<div class="modal-body">
								<div class="form-horizontal">
									<div class="form-group">
										<form method="post"
											action="<%=request.getContextPath()%>/back_end/catagory/cat.do">
											<label class="col-sm-3 control-label">分類規格查詢</label>
											<div class="col-sm-6">
												<select size="1" name="cat_id" class="form-control">
													<option value="-1">請選擇</option>
													<c:forEach var="catVO" items="${catSvc.getAll()}">
														<option value="${catVO.cat_id}">
															${catVO.cat_id}【${catVO.cat_des}】</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-sm-3">
												<input type="hidden" name="action" value="listSpecByCat">
												<input type="submit" value="送出查詢" class="btn btn-info">
											</div>
										</FORM>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!--End row-->
		</div>
		<!-- End Wrapper-->

		<%@ include file="/back_end/footerMenu.jsp"%>

	</div>
	<!--End main content -->

	<%@ include file="/back_end/footerSection.jsp"%>
</body>
</html>
