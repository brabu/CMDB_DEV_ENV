function validateform()
{
   if($('#new_passenger input[type=checkbox]:checked').length==0){
      alert("Please Check atleast one checkbox")	
      return false;
   }
   return true;
}	