function formAutoSubmit () {
var frm = document.getElementById("autosubmit");
frm.submit();
}
window.onload = formAutoSubmit;

document.onreadystatechange = formAutoSubmit;