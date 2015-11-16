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

/**
 * datatable
 */
$(document).ready(function(){
    $('#tpost').DataTable({    	
    	"order": [[ 0, "desc" ]],
    	"language": {
            "lengthMenu": "Hiển thị _MENU_ bài",
            "zeroRecords": "Chưa có dữ liệu",
            "search":         "Tìm kiếm:",
            "info":           "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ bài",
            "infoEmpty": "Chưa có dữ liệu",
            "infoFiltered": "(Lọc từ _MAX_ bài)",
            "paginate": {
                "first":      "Trang đầu",
                "last":       "Trang cuối",
                "next":       "Trang sau",
                "previous":   "Trang trước"
            },
            "aria": {
                "sortAscending":  ": Chọn để sắp xếp tăng dần",
                "sortDescending": ": Chọn để sắp xếp giảm dần"
            }
    	}
    });
});

function commentButtonClick(){
	$.ajax({
		type : "post",
		url : "postdetail",
		data : {txtComment:$("#txtComment").val()},		
		success : function(data) {
			$("#comment_list").append(data);
		}
	});
}