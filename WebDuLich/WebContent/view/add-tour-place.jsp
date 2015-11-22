
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="java.util.List"%>
<%@page import="dto.dtoLocation"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelLocation"%>
<%
	dtoPost edit = (dtoPost)request.getAttribute("edit");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Thêm địa điểm du lịch</title>


<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<script type="text/javascript"
	src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>
<script src="view/resource/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="body-header.jsp" />

	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row">

			<!-- .column 1-->
			<div class="col-md-2"></div>
			<!-- /.column 1-->
			<!-- .column 2-->
			<div class="col-md-8">

				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<form role="form" method="post" action="AddTourPlace">
								<%
									if(edit.getPostId() != "")
									{
										out.print("<input type='hidden' name='edit_post' value='"+edit.getPostId()+"'>");		
									}
								%>
								
								<div class="form-group">
									<label for="tour_title">Tên điểm du lịch:</label> <input
										type="text" class="form-control" required name="txt_place"
										placeholder="Khu du lịch sơn lâm" value="<%out.print(edit.getTitle());%>" id="tour_title">
								</div>
								
								<div class="form-group">
									<label for="sel1">Tỉnh thành:</label> <select
										name="txt_location" class="form-control" style="width: 60%"
										id="sel1">
										<%
											ModelLocation mdLocation = new ModelLocation();
											List<dtoLocation> locations = mdLocation.getAllLocation();
											for(dtoLocation l: locations)
											{
												out.print("<option value=\""+l.getLocationId()+"\">"+l.getDescription() + " " + l.getName()+"</option>");
											}
										%>
									</select>
								</div>
								
								<div class="form-group">
									<label for="tour_detail">Mô tả địa điểm:</label>
									<textarea name="txt_detail" required class="form-control"
										rows="20" id="tour_detail"><%=edit.getContent() %></textarea>
								</div>						
								<div class="form-group">
									<button type="submit" name="btn_post" class="btn btn-primary">Đăng</button>
								</div>
							</form>
						</div>
					</div>
				</div>



			</div>

		</div>
		<script>
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('tour_detail', {
				height : 350
			});
		</script>
		<!-- /.column 2-->
		<!-- .column 3-->
		<div class="col-md-2"></div>

	</div>
	</div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>




