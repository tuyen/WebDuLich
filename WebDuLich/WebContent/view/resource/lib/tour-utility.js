/**
 * show tooltip
 */
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});

/**
 * show loading icon when loading data
 */
$(document).ajaxStart(function() {
	$("#loading").show();
});

/**
 * hide loading icon when data load completely
 */
$(document).ajaxStop(function() {
	$("#loading").hide();
});

function bookTour(cate, post) {
	var post_url = window.location;	
	$.ajax({
		type : "post",
		url : "postdetail",
		data : {
			bookTour : $("#book_tour").attr("value"),
			postUrl : post_url.toString(),
			categoryId : cate,
			postId : post
		},
		success : function(data) {
			$("#book_status").html(data);
			if(data === "Bạn đã đặt tour thành công, đơn vị lữ hành sẽ liên hệ với bạn sớm nhất có thể. Chúc bạn có những chuyến đi thú vị!"){
				$("#book_tour").html("Hủy đặt tour");
				$("#book_tour").attr("value", "0");
			}
			else{
				$("#book_tour").html("Đặt tour");
				$("#book_tour").attr("value", "1");
			}
		}
	});
}

/**
 * function go to top
 */
$(document).ready(function() {
	var offset = 250, // At what pixels show Back to Top Button
	scrollDuration = 300; // Duration of scrolling to top
	$(window).scroll(function() {
		if ($(this).scrollTop() > offset) {
			$('.top').fadeIn(500); // Time(in Milliseconds) of appearing of the
			// Button when scrolling down.
		} else {
			$('.top').fadeOut(500); // Time(in Milliseconds) of disappearing of
			// Button when scrolling up.
		}
	});

	// Smooth animation when scrolling
	$('.top').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop : 0
		}, scrollDuration);
	})
});

function commentButtonClick() {
	$.ajax({
		type : "post",
		url : "postdetail",
		data : {
			txtComment : $("#txtComment").val()
		},
		success : function(data) {
			$("#comment_list").append(data);
		}
	});
}

