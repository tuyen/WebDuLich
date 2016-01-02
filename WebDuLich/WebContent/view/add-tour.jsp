<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="java.util.List"%>
<%@page import="dto.dtoPost"%>
<%@page import="dto.dtoTouristPlace"%>
<%@page import="model.ModelLocation"%>
<%
	dtoPost edit = (dtoPost)request.getAttribute("edit");
	List<dtoTouristPlace> places = (List<dtoTouristPlace>)request.getAttribute("places");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Thêm tour du lịch - Banana Tour</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />

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
<link href="view/resource/css/add_tour.css" rel="stylesheet">
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
							<form role="form" action="AddTour" method="post">

								<%
									if(edit.getPostId() != "")
									{
															out.print("<input type='hidden' name='edit_post' value='"+edit.getPostId()+"'>");		
									}
								%>
								<div class="form-group">
									<label for="tour_title">Tên của tour:</label> <input
										type="text" class="form-control"
										oninput="setCustomValidity('')" required
										oninvalid="this.setCustomValidity('Vui lòng nhập tên của tour')"
										name="tourName" value="<%=edit.getTitle()%>" id="tour_title">
								</div>
								
								<div class="form-group col-xs-6">
									<label for="tour_price">Giá tour:</label> <input type="text"
										class="form-control" name="tourPrice"
										value="<%=edit.getPrice()%>" required id="tour_price"
										placeholder="Ex. Từ 10 đến 20 triệu"
										oninput="setCustomValidity('')"
										oninvalid="this.setCustomValidity('Bạn chưa chọn giá tour')">
								</div>
								<div class="form-group col-xs-6">
									<label for="numberOfPeople">Số người:</label> <input
										type="text" class="form-control" name="numberPeople"
										value="<%=edit.getNumberPeople()%>" required
										id="numberOfPeople" oninput="setCustomValidity('')"
										oninvalid="this.setCustomValidity('Bạn chưa nhập số người!')"
										maxlength="5"
										onkeypress='return (event.charCode == 0)||(event.charCode >= 48 && event.charCode <= 57)'>
								</div>

								<div class="form-group" id="placeList">
									<%
										for(dtoTouristPlace t : places)
																{
																	String data = "<input id='txt_hidden_place_"+t.getPlaceId()+"' type='hidden' name='placeId[]' value='"+t.getPlaceId()+"'>";
																	out.print(data);
																}
									%>

								</div>

								<label>Điểm du lịch: </label>
								<div class="form-group" id="viewPlaceList">

									<%
									for(dtoTouristPlace t : places)
									{
										String localtion = "<button id='btn_view_place_"+t.getPlaceId()+"' class='btn btn-default category_margin_left' type='button' onclick='removePlace(\"place_"+t.getPlaceId()+"\")'>"+
												t.getTitle()+
												"<span class='glyphicon glyphicon-remove'></span></button>";
										out.print(localtion);
									}
										
									%>

								</div>

								<div class="form-group">
									<label for="sel1">Chọn địa điểm:</label> <select
										onchange="addNewPlace(this);" class="form-control"
										style="width: 60%" id="sel1">
										<option value="-1" selected> Chưa chọn địa điểm nào </option>
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
								<div class="form-group">
									<label for="tour_time">Thời gian đi:</label> <input type="text"
										class="form-control" oninput="setCustomValidity('')" required
										oninvalid="this.setCustomValidity('Vui lòng nhập thời gian đi của tour')"
										name="tourTime" id="tour_time"
										value="<%=edit.getTotalTime()%>"
										placeHolder="Ex. Ba ngày 2 đêm">
								</div>
								<script type="text/javascript">
									function isExisted(id) {
										if (document.getElementById(id) == null) {
											return false;
										}
										return true;

									}

									function removePlace(id) {

										if (isExisted("btn_view_" + id)) {
											try {
												var placeList = document
														.getElementById("placeList");
												var viewPlaceList = document
														.getElementById("viewPlaceList");
												var btn = document
														.getElementById("btn_view_"
																+ id);
												var place = document
														.getElementById("txt_hidden_"
																+ id);
												placeList.removeChild(place);
												viewPlaceList.removeChild(btn);
											} catch (e) {
												// TODO: handle exception
											}

										}
									}

									function addNewPlace(sel) {
										var text = sel.options[sel.selectedIndex].text;
										var _value = sel.options[sel.selectedIndex].value;
										if(_value == "-1")
										{
											return false;
										}
										try {
											var dom = document
													.getElementById("placeList");
											var node = document
													.createElement("input");
											node.type = "hidden";
											node.name = "placeId[]";
											node.id = "txt_hidden_" + "place_"
													+ _value;
											node.value = _value;
											if (!isExisted(node.id)) {
												dom.appendChild(node);
												var dom = document
														.getElementById("viewPlaceList");
												var btn = document
														.createElement("button");
												btn.type = "button";
												btn.id = "btn_view_" + "place_"
														+ _value;
												btn.onclick = function() {
													removePlace("place_"
															+ _value);
												}
												btn.className = "btn btn-default category_margin_left";
												btn.innerHTML = text
														+ " <span class=\"glyphicon glyphicon-remove\"></span>";
												dom.appendChild(btn);
											}

										} catch (e) {
											// TODO: handle exception
										}

									}

									function hasAPlace() {
										var data = document
												.getElementById("placeList").innerHTML;
										if (data.trim() == "") {
											alert("Bạn chưa chọn địa điểm cho tour");
											return false;
										}
										return true;
									}
								</script>

								<div class="form-group">
									<label for="tour_detail">Chi tiết tour:</label>
									<textarea class="form-control" required rows="15"
										name="tourDetail" id="tour_detail"><%=edit.getContent()%></textarea>
								</div>

								<div class="form-group">
									<button type="submit" onclick="return hasAPlace()"
										class="btn btn-primary">Thêm tour</button>
								</div>
							</form>
						</div>
					</div>
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



