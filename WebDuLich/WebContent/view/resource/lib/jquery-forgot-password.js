$(document).ready(function() {
	$('#emailForm').submit(function(event) {
		if (!$(this).attr('validated')) {
//			event.preventDefault();
			$.ajax({
				url : 'ControllerForgotPassword',
				data : {
					email_ajax : $('#email').val(),

				},
				type : 'GET',
				success : function(data) {
					if (data != "") {
						$('#hintError').text(data);
					}

					else {
						$('#hintError').text("");
						$('#emailForm').attr('validated',true);
						$('#emailForm').unbind().submit();
					}
				}
			});
			return false;
		}
		return true;

	});
	// $('#signinForm').submit();
});
function checkSubmit() {

	// alert($('#hintError').text());
	if ($('#hintError').text() == "") {
		return true;
	} else {
		return false;
	}
}