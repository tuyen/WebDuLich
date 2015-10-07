<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>


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
<script src="view/view/resource/ckeditor/ckeditor.js"></script>
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
				<div>
					<h4>Đánh giá về tour: Tour đi Nha Trang ba ngày sáu đêm</h4>
					<form role="form">
						<div class="form-group">
							<input type="hidden" class="form-control" id="tour_title">
						</div>
						<div class="form-group">
							<label for="tour_detail">Viết cảm nhận:</label>
							<textarea class="form-control" rows="15" id="tour_detail"></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">POST</button>
						</div>
					</form>
				</div>

			</div>
			<script>
				// Replace the <textarea id="editor1"> with a CKEditor
				// instance, using default configuration.
				CKEDITOR.replace('tour_detail');
			</script>
			<!-- /.column 2-->
			<!-- .column 3-->
			<div class="col-md-2"></div>

		</div>
	</div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>









