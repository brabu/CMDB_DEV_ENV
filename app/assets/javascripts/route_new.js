$(document).ready(function(){
  $('#route_sid').change(function(){
    $('#route_did').html($('#route_sid').html());
    $("#route_did option[value='"+ $('#route_sid option:selected').val() +"']").remove();
  });
});


function validateform(){
  if ($('#route_sid option:selected').val() != "" && $('route_#did option:selected').val() != "" && $('#fare').val() != ""&& $('#st').val() != ""&& $('#et').val() != "")
  {
    return true;
  }
  else
  {
    alert("Please Fill all the fields");
    return false;
  }
}
