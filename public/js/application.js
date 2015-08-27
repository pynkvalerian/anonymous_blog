$(document).ready(function() {

  $("form[action='/post/new']").toggle();

  $("#create_post").on("click", function(){
    $("form[action='/post/new']").toggle();
  });

});
