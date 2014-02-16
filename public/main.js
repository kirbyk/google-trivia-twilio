window.setTimeout(function(){location.reload()},5000)
var reset = function(){
  $.get('/reset', function(){
    location.reload();
  });
}
