// window.setTimeout(function(){location.reload()},1000)

  var reset = function(){
    location.reload();
    $.ajax({
      type: "GET",
    url: "/reset",
    });
  }
