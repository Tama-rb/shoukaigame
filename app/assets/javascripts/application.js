// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() { 

  offsetMob = $('#mob').offset();
  x = offsetMob.left;
  y = offsetMob.top;
  console.log(x);
  console.log(y);
  

  function keydown(event) {
    $('#mob').css('position', 'fixed');
    switch (event.keyCode) {
      case 37: x -= 10; break;
      case 38: y -= 10; break;
      case 39: x += 10; break;
      case 40: y += 10; break;
    }

    document.getElementById('mob').style.left = x + "px";
    document.getElementById('mob').style.top = y + "px";
  }

  document.onkeydown = keydown;
});
