// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function(){
    $('#sort_status').click(function(event){
      event.preventDefault();
        var orders = $('.table_rows');
        console.log(orders);
        orders.sort(SortByStatus);
    });
});


function SortByStatus(a, b){
  var aStatus = a.children();
  var bStatus = b.children();
  console.log(aStatus);
  console.log(bStatus);
  return ((aStatus < bStatus) ? -1 : ((aStatus > bStatus) ? 1 : 0));
}
