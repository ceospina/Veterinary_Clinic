// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function () {  
 $('#partials .pagination a').live('click',    
    function () {  
      $.getScript(this.href);  
    return false;  
    }  
  );  
  
 /*  $("animales_search").submit(function () {  
     $.get(this.action, $(this).serialize(), null, "script");  
     return false;  
   });  
  */
   $('#search input').keyup(function () {  
      $.get($('#search').attr('action'), 
        $('#search').serialize(), null, 'script');  
      return false;  
    });  
});   
$(function() {$( "#accordion" ).accordion({event: "mouseover"});});
//efecto datepicker
$(function() {$( "#datepicker" ).datepicker();});