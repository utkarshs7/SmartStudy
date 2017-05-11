/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
$("#send").click(function(e) {
e.preventDefault();
var name = $("#Name").val();
var email = $("#Email").val();
var password = $("#Password").val();
if (!(name == '' || email == '' || password == '')) {
$("#submitdata").empty();
$("#submitdata").append("Name: " + name + "<br/>Email: " + email + "<br/>Message: " + msg);
} else {
alert("Please Fill All Fields.");
}
});
});

