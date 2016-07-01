$(document).ready(function() {
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  var monthsEvents;
  $.getJSON( "/playdates/json/all", function(jsonEvents) {
    monthsEvents = jsonEvents;
    $('#all-calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      editable: true,
      selectable: true,
      selectHelper: true,
      weekMode: 'fixed',

      events: monthsEvents,

      eventClick: function(calEvent, jsEvent, view) {
        console.log(calEvent.id)
        $.get('/playdates/' + calEvent.id, {id: calEvent.id}, function(playdateDetails){
          console.log(playdateDetails);
          $(".playdate-id").remove();
          $("#all-calendar").after(playdateDetails);
        })
      }
    })

  });

  var currentProfile = $("span.profile").attr("profile");
  $.getJSON( "/playdates/json/profile", {profile: currentProfile}, function(jsonEvents) {
    monthsEvents = jsonEvents;
    $('#profile-calendar').fullCalendar({
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


  $("span#attendee-title").on("click", function(e){
    e.preventDefault();
    $("span#attendee-detail").slideToggle("slow");
  });

  /* Set the width of the side navigation to 250px and the left margin of the page content to 250px */

  $(".nav-close").on("click", function(){closeNav()});
  $("#nav-open").on("click", function(){openNav()});


  function openNav() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("main").style.marginLeft = "250px";
  }

  /* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
  function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft = "0";
  }


});
