$(document).ready(function() {
  
  $("a[class='playdate-title']").on("click", function(e){
    e.preventDefault();
    var route = $(this).attr("href");
    var $thisPlaydate = $(this).parent();
    var thisPlaydateDetails = $thisPlaydate.siblings(".playdate-details")
    $(thisPlaydateDetails).slideToggle("slow");
  })

});
