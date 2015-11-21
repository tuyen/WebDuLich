$(document).ready(function() {
	$('#company1').hide();
	$('#company2').hide();
	document.getElementById('company_name').disabled = true;
	document.getElementById('company_description').disabled = true;

	$('#account_personal').click(function() {
		$('#company1').hide();
		$('#company2').hide();
		document.getElementById('company_name').disabled = true;
		document.getElementById('company_description').disabled = true;
	});
	$('#account_company').click(function() {
		$('#company2').show();
		$('#company1').show();
		document.getElementById('company_name').disabled = false;
		document.getElementById('company_description').disabled = false;
	});
});
/**
 * Hiện placeholder phía trên input khi focus
 * 
 */
$(document).ready(function() {
	$('form input ').tooltip({
		placement : 'top',
		trigger : 'focus',
		title : function() {
			return $(this).attr('placeholder');
		}
	});
	$('#company_decription').tooltip({
		placement : 'top',
		trigger : 'focus',
		title : function() {
			return $(this).attr('placeholder');
		}
	});
});

/**
 * Kiểm tra mật khẩu lặp lại ok ko
 * 
 * @returns {Boolean}
 */
function CheckPassword() {
	var password1 = document.forms["signupForm"]["password"].value;
	var password2 = document.forms["signupForm"]["password_confirmation"].value;
	var ok = true;
	if (password1 !== password2) {
		// alert("Passwords do not match");
		document.forms["signupForm"]["password"].style.borderColor = "#E34234";
		document.forms["signupForm"]["password_confirmation"].style.borderColor = "#E34234";
		$('#hintPassword').text(
				"Mật khẩu xác nhận không đúng, Vui lòng nhập lại!");
		ok = false;
	} else {
		document.forms["signupForm"]["password"].style.borderColor = "#CCC";
		document.forms["signupForm"]["password_confirmation"].style.borderColor = "#CCC";
		$('#hintPassword').text("");
	}
	// e.preventDefault();
	return ok;
}
/**
 * gọi hàm ChckPassword mỗi lần nhập input
 * 
 */
$(document).ready(function() {

	$('#password').keyup(CheckPassword);
	$('#password_confirmation').keyup(CheckPassword);
});
/**
 * Kiểm tra các input ok chưa. Nếu ok mới đc submit
 * 
 * @returns {Boolean}
 */
function checkSubmit() {
	var ok = CheckPassword();

	if (ok == true && $('#hintEmailExist').text() == "")
		return true;
	else
		return false;
}
/**
 * Kiểm tra email đăng kí có tồn tại hay không
 */
$(document)
		.ready(
				function() {
					$('#email')
							.on(
									'blur keyup',
									function(event) {
										$
												.ajax({
													url : 'ControllerSignUp',
													data : {
														email_ajax : $('#email')
																.val()
													},
													type : 'GET',
													success : function(
															responseText) {
														if (responseText != "") {
															$('#hintEmailExist')
																	.text(
																			responseText);
															document.forms["signupForm"]["email"].style.borderColor = "#E34234";
														} else {
															$('#hintEmailExist')
																	.text("");
															document.forms["signupForm"]["email"].style.borderColor = "#CCC";
														}
													}
												});
									});
				});

$(document).ready(function() {
	$('button#btn-signin').click(function(event) {

		$.ajax({
			url : 'ControllerSignIn',
			data : {
				email_ajax : $('#user_username').val(),
				password_ajax : $('#user_password').val()
			},
			type : 'POST',
			success : function(data) {
				if (data == "true") {
					$('#signin').hide();
					$('#signup').hide();
				} else {
					$('#hintError').text(data);
				}
			}
		});

	});
	// $('#signinForm').submit();
});
$(document).ready(
		function() {
			jQuery.each(jQuery('textarea[data-autoresize]'), function() {

				var offset = this.offsetHeight - this.clientHeight;

				var resizeTextarea = function(el) {
					jQuery(el).css('height', 'auto').css('height',
							el.scrollHeight + offset);
				};
				jQuery(this).on('keyup input', function() {
					resizeTextarea(this);
				}).removeAttr('data-autoresize');
			});
		});
