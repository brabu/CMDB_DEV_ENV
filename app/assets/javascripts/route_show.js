$(document).ready(function(){  
  $('#route_sid').change(function(){
    $('#route_did').html($('#route_sid').html());
    $("#route_did option[value='"+ $('#route_sid option:selected').val() +"']").remove();
  });
});

function restrictDate() {
  var mindate = new Date().toISOString().split('T')[0];
  document.getElementById("date").setAttribute('min', mindate);
  var maxdate = new Date();
  maxdate.setDate(maxdate.getDate() + 60);
  var maxdate = maxdate.toISOString().split('T')[0];
  document.getElementById("date").setAttribute('max', maxdate);
  var e = document.getElementById('route_sid');
}

window.onload = restrictDate;

function validateform() {

  if ($('#place_sid option:selected').val() != "" && $('#place_did option:selected').val() != "" && $('#date').val() != ""){
    return true;
  }
  else
  {
    alert("Please Fill all the fields");
    return false;
  }
}
   