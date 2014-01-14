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
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require semantic-ui
#= require slider
#= require timeago
# require_tree .
NProgress.configure
  showSpinner: true
  ease: 'ease'
  speed: 500

loader_remove = ->
	$("#loader").removeClass "active"
	return

loader_add = ->
	$("#loader").addClass "active"
	return

$(document).on 'page:fetch', ->
  NProgress.start()
  $(".timeago").timeago()
#  loader_add()
  return

$(document).on 'page:restore', ->
  NProgress.remove()
  $(".timeago").timeago()
#  loader_remove()
  return

$(document).ready ->
  NProgress.done()
#  loader_remove()
  return


$(document).ready ->
	$(".timeago").timeago()

$(document).load ->
	$(".timeago").timeago()
