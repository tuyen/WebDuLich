<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@page import="java.util.List"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelLocation"%>

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
<script src="view/resource/ckeditor/ckeditor.js"></script>
<link href="view/resource/css/add_tour.css"
	rel="stylesheet">
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
					<form role="form" action="AddTour" method="post">
						<div class="form-group">
							<label for="tour_title">Tên của tour:</label> <input type="text"
								class="form-control" name="tourName" id="tour_title">
						</div>
						<div class="form-group">
							<label for="tour_detail">Chi tiết tour:</label>
							<textarea class="form-control" rows="15" name="tourDetail" id="tour_detail"></textarea>
						</div>
						<div class="form-group">
							<label for="tour_price">Giá tour:</label> <input type="text"
								class="form-control" name="tourPrice" id="tour_price"
								placeholder="Ex. Từ 10 đến 20 triệu">
						</div>


						<div class="form-group" id="placeList">
							
						</div>

						<label>Địa điểm: </label>
						<div class="form-group" id="viewPlaceList">							
						</div>

						<div class="form-group">
							<label for="sel1">Chọn địa điểm:</label> <select
								onchange="addNewPlace(this);" class="form-control"
								style="width: 60%" id="sel1">
								<%
								
									ModelLocation mdLocation = new ModelLocation();
									List<dtoPost> locations = mdLocation.getAllTourPlace();
									for(dtoPost l: locations)
									{
										out.print("<option value=\""+l.getPostId()+"\">"+ " " + l.getTitle()+"</option>");
									}								
																	
								%>																						
							</select>
						</div>

						<script type="text/javascript">
						
							function isExisted(id)
							{
								if(document.getElementById(id) == null)
								{
									return false;
								}
								return true;
									
							}
						
							function removePlace(id)
							{
								
								if(isExisted("btn_view_"+id))
								{
									try
									{
										var placeList = document.getElementById("placeList");
										var viewPlaceList = document.getElementById("viewPlaceList");
										var btn = document.getElementById("btn_view_"+id);
										var place = document.getElementById("txt_hidden_"+id);
										placeList.removeChild(place);
										viewPlaceList.removeChild(btn);
									}catch (e) {
										// TODO: handle exception
									}
									
								}
							}
							
							function addNewPlace(sel)
							{
								var text = sel.options[sel.selectedIndex].text;
								var _value =  sel.options[sel.selectedIndex].value;								
								try
								{
									var dom = document.getElementById("placeList");
									var node = document.createElement("input");
									node.type="hidden";
									node.name = "placeId[]";
									node.id = "txt_hidden_"+"place_"+_value;
									node.value = _value;
									if(!isExisted(node.id))
									{
										dom.appendChild(node);																
										var dom = document.getElementById("viewPlaceList");
										var btn = document.createElement("button");
										btn.type="button";
										btn.id = "btn_view_"+"place_"+_value;
										btn.onclick = function()
										{
											removePlace("place_" + _value);
										}
										btn.className="btn btn-default category_margin_left";
										btn.innerHTML = text + " <span class=\"glyphicon glyphicon-remove\"></span>";
										dom.appendChild(btn);										
									}									
																		
								}catch (e) {
									// TODO: handle exception
								}
								
							}
						</script>

						<div class="form-group">
							<button type="submit" class="btn btn-primary">Thêm tour</button>
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



