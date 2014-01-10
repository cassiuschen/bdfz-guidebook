# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$bg = $("#bg")
	$w = $(window)
	wh = bh = $w.height()
	ww = bw = $w.width()
	use_height = ->
		bh = $bg.height()
		bw = $bg.width()
		pl = - (ww-bw)/2
		$bg.css(
			top: 0
			height: "100%"
			left: pl
			position: "fixed"
			right: "auto"
			bottom: "auto"
			)
		return
	use_width = ->
		bh = $bg.height()
		bw = $bg.width()
		pt = ( wh - bh ) / 2
		$bg.css(
			top: pt
			width: "100%"
			left: 0
			position: "fixed"
			right: "auto"
			bottom: "auto"
			)
		return
	resizeImg = (bh,bw) =>
		switch
			when wh >= bh then use_height()
			when wh < bh then use_width()
		return
	$bg.load ->
		bh = $bg.height()
		bw = $bg.width()
		#resizeImg(bh,bw)
		switch
			when wh >= bh then use_height()
			when wh < bh then use_width()
		return
	return
	

#t = n = 0
#$(document).ready ->
#	count = $("#banner_list a").length;
#	ww = $(window).width()
#	wh = $(window).height()
#	item = $("#banner_list a")
#	item.each (i) =>
#		this.index = i
#		return
#	item.load ->
#		resizeImg(this)
#		p = $(this).parent()
#		if p.index()
#			p.hide()
#		return
#	resizeImg (img) =>
#		img = $(img)
#		w = img.width()
#		h = img.height()
#		if bh < h
#			w = parseInt wh/h*w
#			h = wh
#		else if bw < w
#		    h = parseInt ww/w*h
#		    w = ww
#		else
#			if w > h
#				h = parseInt ww/w*h
#				w = ww
#			else
#				w = parseInt wh/h*w
#				h = wh
#		img.css(
#			width: w
#			height: h
#			)
#		img.parent().css(
#			left: (ww-w)>>1
#			top: (wh-h)>>1
#			)
#		return
#	$("#banner li").click ->
#		i = $(this).text -1;
#		n = i
#		if i>= count
#			return
#		item.filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000)
#		$(this).toggleClass "on"
#		$(this).siblings()removeAttr "class"
#			
