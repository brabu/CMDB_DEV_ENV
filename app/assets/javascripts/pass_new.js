function validateform(){
  var flag=true;
  $.each($('.inputname'), function() {
    if(flag && $.trim($(this).val()) == "")	{	
     flag=false;
    }
  });
  if(flag)
     return true;
  else
  {
     alert("Please Fill all the names");
     return false;
  }
}