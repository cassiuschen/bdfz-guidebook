# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require nprogress
#= require nprogress-turbolinks
#= require timeago
#= require simditor
#= require angular
#= require angular-animate
#= require angular-resource
#= require angular-touch
#= require angular-sanitize
#= require angular-cookies
#= require angular-route
#= require_tree .
#= require_tree ./angular
# require_tree ./angular/services
#= require_tree ./angular/controllers
# require_tree ../templates

window.App =
	Affix : () ->
	    $window = $('window')
	    $body = $('body')
	    navHeight = $('.navbar').outerHeight(true) + 10

	    $window.on "load", ->
	        $body.scrollspy 'refresh'
	        return

	    $('body [href=#]').click (e) ->
	        e.preventDefault()

	    setTimeout ->
	        $sideBar = $('.onspy')

	        $sideBar.affix(
	            offset :
	                top : () ->
	                		offsetTop = $sideBar.offset().top
	                		sideBarMargin  = parseInt $sideBar.children(0).css('margin-top'),10
	                		navOuterHeight = $('nav.navbar').height()
	                		return this.top = offsetTop - navOuterHeight - sideBarMargin

	                	bottom : () ->
	                		return this.bottom = $('footer').outerHeight true
	        )
	        return
	    ,100
	    return

	Simditor : (value) ->
		editor = new Simditor
    		textarea: $('.simditor')
    		upload: true
    		toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
    	editor.setValue = value
 
	Init : () ->
		App.Affix()
		$originWidth = $('#affix-bar').width()
		$('.affix-top').css "width",$originWidth
		$('.affix').css "width",$originWidth
		$('.affix-bottom').css "width",$originWidth
		$(".timeago").timeago()

$(document).ready ->
	App.Init()
	$(".timeago").timeago()

$ ->
	if $.turbo.isReady == true
		App.Init()

$(document).on 'click', 'button', () ->
	App.Init
	$(".timeago").timeago()
