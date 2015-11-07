
$(document).ready(function () {
	$('form input').tooltip({
		placement: 'top',
		trigger: 'focus',
		title: function (){
			return $(this).attr('placeholder');
		}
	});
});

function CheckPassword() {
	var password1 = document.forms["signupForm"]["password"].value;
	var password2 = document.forms["signupForm"]["password_confirmation"].value;
	var ok = true;
	if (password1 !== password2) {
// alert("Passwords do not match");
document.forms["signupForm"]["password"].style.borderColor = "#E34234";
document.forms["signupForm"]["password_confirmation"].style.borderColor = "#E34234";
$('#hintPassword').text("Mật khẩu xác nhận không đúng, Vui lòng nhập lại!");
ok = false;
}
else {
	document.forms["signupForm"]["password"].style.borderColor = "#CCC";
	document.forms["signupForm"]["password_confirmation"].style.borderColor = "#CCC";
	$('#hintPassword').text("");
}
    // e.preventDefault();
    return ok;
}
$(document).ready(function () {

	$('#password').keyup(CheckPassword);
	$('#password_confirmation').keyup(CheckPassword);
});
function checkSubmit()
{
	var ok = CheckPassword();
	
	if (ok==true && $('#hintEmailExist').text()=="")
		return true;
	else
		return false;
}
$(document).ready(function() {
	$('#email').on('blur keyup', function(event) {
		$.ajax({
			url : 'ControllerSignUp',
			data : {
				email_ajax : $('#email').val()
			},
			type:'GET',
			success : function(responseText) {
				if (responseText!="")
				{
					$('#hintEmailExist').text(responseText);
					document.forms["signupForm"]["email"].style.borderColor = "#E34234";
				}
				else
				{
					$('#hintEmailExist').text("");
					document.forms["signupForm"]["email"].style.borderColor = "#CCC";
				}
			}
		});
	});
});

$(document).ready(function(){
	$('#btn-signin').click(function(event){
		
		$.ajax({
			url : 'ControllerSignIn',
			data : {
				email_ajax : $('#user_username').val(),
				password_ajax : $('#user_password').val()
			},
			type:'POST',
			success:function(data){
				if (data=="true")
				{
					$('#signin').hide();
					$('#signup').hide();
				}
				else
				{
					$('#hintError').text(data);	
				}	
			}
		});
		
	});	
	// $('#signinForm').submit();
});