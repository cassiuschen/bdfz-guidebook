# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Home =
	use_height : () ->
		$bg = $("#bg")
		$bg.removeClass "use_width"
		$bg.addClass "use_height"
		return
	use_width : () ->
		$bg = $("#bg")
		$bg.removeClass "use_height"
		$bg.addClass "use_width"
		return
	resizeImg : () ->
		$bg = $("#bg")
		bw = $bg.width()
		bh = $bg.height()
		$w = $(window)
		wh = $w.height()
		ww = $w.width()
		wp = 10000 * wh / ww
		bp = 10000 * bh / bw 
		switch
			when wp > bp then Home.use_height()
			when wp = bp then Home.use_width()
			when wp < bp then Home.use_width()
		return

$("#bg").load ->
	Home.resizeImg()
	return
return




$(document).ready ->
	Home.resizeImg()
	alter

window.addEventListener "resize", ->
	Home.resizeImg()
	return
$(document).on 'page:loadfetched', ->
	Home.resizeImg()

$(document).on 'page:restorefetched', ->
 	Home.resizeImg()
 	return
$(document).on 'page:changepage', ->
 	Home.resizeImg()
 	return

	
#	lf = $("#login")
#	lc = lf.children()
#	lch = lc.height()
#	lfh = lf.height()
#	set_login_height = ->
#		lf.css(
#			"margin-top": "#{-lch-8}px}"
#			height: "#{lch+8}px"
#			width: "100%"
#			)
#	set_login_height()

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
