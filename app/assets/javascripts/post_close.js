$("#close").click(function() {
  $("#modal").remove();
  $("body").css("overflow", "visible");
});
$(".modal-dialog").click(function() {
  $("#modal").remove();
  $("body").css("overflow", "visible");
  return false;
});
$(".modal-content").click(function(e){
  e.stopPropagation();
});  