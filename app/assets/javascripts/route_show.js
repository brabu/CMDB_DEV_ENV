$(document).ready(function(){  
  $('#route_sid').change(function(){
    $('#route_did').html($('#route_sid').html());
    $("#route_did option[value='"+ $('#route_sid option:selected').val() +"']").remove();
  });
});



window.onload = function () {
  var mindate = new Date().toISOString().split('T')[0];
  document.getElementById("date").setAttribute('min', mindate);
  var maxdate = new Date();
  maxdate.setDate(maxdate.getDate() + 60);
  var maxdate = maxdate.toISOString().split('T')[0];
  document.getElementById("date").setAttribute('max', maxdate);
  var e = document.getElementById('route_sid');
}

function validateform() {

  if ($('#route_sid option:selected').val() != "" && $('#route_did option:selected').val() != "" && $('#date').val() != ""){
    return true;
  }
  else
  {
    alert("Please Fill all the fields");
    return false;
  }
}
   