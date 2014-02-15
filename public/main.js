window.setTimeout(function(){location.reload()},5000)

var reset = function(){
  location.reload();
  $.ajax({
    type: "GET",
    url: "/reset"
  });
}
