$(document).ready(function() {
  $(".skill-choice").click(function() {
    if ($(this).hasClass("active")) {
      $(this).removeClass("active");
    } else {
      $(this).addClass("active");
    }
  });
});
