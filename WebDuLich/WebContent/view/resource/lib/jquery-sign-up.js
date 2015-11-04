
$(document).ready(function () {
	alert('abc');
    $('form input').tooltip({
      placement: 'top',
      trigger: 'focus',
      title: function (){
        return $(this).attr('placeholder');
      }
    });
});

$(document).ready(function CheckPassWord() {
    var pw = document.getElementsById('password').value;
    var pw_c = document.getElementsById('password_confirmation').value;
    var ok = true;
     if (pw != pw_c) {
        alert("Passwords Do not match");
        document.getElementById("password").style.borderColor = "#E34234";
        document.getElementById("password_confirmation").style.borderColor = "#E34234";
        ok = false;
    }
    else {
        alert("Passwords Match!!!");
    }
    return ok;
});
