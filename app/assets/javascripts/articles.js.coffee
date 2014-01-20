ArticleInit = ->
	$back = $("#back_to_index")
	$backword = $("#back_to_index_word")
	if_open = false
	$bar = $('.sidebar')
	$hrefbar = $('.item')

	$back.mouseenter ->
		$back.animate( {'width':'155px'} , { 
			duration:150,
			easing:'jswing',
			complete: ->
				$backword.css("display","inline")
			 })
		return

	$back.mouseleave ->
		$back.animate( {'width':'70px'} , { duration:150,easing:'easeInOutCirc' })
		$backword.css("display","none")
		return
	$back.click ->
		$bar.sidebar('toggle')
		return
	$hrefbar.click ->
		$bar.sidebar('toggle')
		return
	$(".question.submit").click ->
		$("#question").form
			title:
				identifier: "question_title"
				role: [
					type: 'empty'
					prompt: "请输入问题标题"
				]
			content:
				identifier: "question_content"
				role: [
					type: 'empty'
					prompt: "请输入问题描述"
				]
		return
	return
$(document).ready ->
	ArticleInit()
	return
$(document).on 'page:loadfetched', ->
	ArticleInit()
$(document).on 'page:restorefetched', ->
 	ArticleInit()
 	return
$(document).on 'page:changepage', ->
 	ArticleInit()
 	return

