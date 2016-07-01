$(document).ready(function() {
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  var monthsEvents;
  var currentProfile = $("span.profile").attr("profile");
  $.getJSON( "/playdates", {profile: currentProfile}, function(jsonEvents) {
    console.log(jsonEvents);
    monthsEvents = jsonEvents;
    console.log(monthsEvents);
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      editable: true,
      selectable: true,
      selectHelper: true,
      weekMode: 'fixed',

      events: monthsEvents
    })
  });

    $("a[class='playdate-title']").on("click", function(e){
      e.preventDefault();
      var route = $(this).attr("href");
      var $thisPlaydate = $(this).parent();
      var thisPlaydateDetails = $thisPlaydate.siblings(".playdate-details")
      $(thisPlaydateDetails).slideToggle("slow");
    })

  });
