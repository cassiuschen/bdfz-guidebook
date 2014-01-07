# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$bg = $("#bg")
	$w = $(window)
	wh = $w.height()
	ww = $w.width()
	bh = $bg.height()
	bw = $bg.width()
	use_height = ->
		pl = ( ww - bw ) / 2
		$bg.css(
			top: 0
			height: "100%"
			left: pl
			position: fixed
			right: auto
			bottom: auto
			)
		return
	use_width = ->
		pt = ( wh - bh ) / 2
		$bg.css(
			top: pt
			width: "100%"
			left: 0
			position: fixed
			right: auto
			bottom: auto
			)
		return
	if bh >= wh 
		use_width()
	else
		use_height()
	return