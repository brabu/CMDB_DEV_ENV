$(document).ready(function(){  
  $('.radio').click(function(){
    $('#selected').val($('#'+$(this).val()).val());
  });
});
  
function validateform(){
  flag = false;
  if($('input:radio:checked').length == 0){
     alert("Please select any one Route")
     return false;
  }
  return true;
}