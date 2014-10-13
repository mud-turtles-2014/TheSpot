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
//= require_tree .
$(document).ready(function(){
	// $('.spot').hover(function(){
	// 		console.log("hover");
	// 		console.log($(this).closest('ul'));
	// 		$(this).children('ul').css('background-color','red');
	// });

	$('.spot').hover(function(){
		$(this).children('ul').css('background','rgba(127,245,235,0.8)');
		$(this).find('.fave-button').show();
	}, function(){
		$(this).children('ul').css('background','rgba(255,255,255,0.7)');
		$(this).find('.fave-button').hide();
	});
});