$(document).ready(function() {
	
	var table = $('#tpost').DataTable({
		"order" : [ [ 0, "desc" ] ],
		"language" : {
			"lengthMenu" : "Hiển thị _MENU_ bài",
			"zeroRecords" : "Chưa có dữ liệu",
			"search" : "Tìm kiếm:",
			"info" : "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ bài",
			"infoEmpty" : "Chưa có dữ liệu",
			"infoFiltered" : "(Lọc từ _MAX_ bài)",
			"paginate" : {
				"first" : "Trang đầu",
				"last" : "Trang cuối",
				"next" : "Trang sau",
				"previous" : "Trang trước"
			},
			"aria" : {
				"sortAscending" : ": Chọn để sắp xếp tăng dần",
				"sortDescending" : ": Chọn để sắp xếp giảm dần"
			}
		}
	});

	$('.modal-footer').on('click', 'button.btn-danger', function() {
		deletePost(post);
	});

	var post;
	$('#tpost tbody').on('click', 'a.btn-danger', function() {
		post = this;

	});

	function deletePost(obj) {
		table.row($(obj).parents('tr')).remove().draw();
		$.ajax({
			url : "post-manager",
			type : "post",
			data : {
				delete_post : $(obj).parents('tr').attr("id")
			}
		});
	}
});