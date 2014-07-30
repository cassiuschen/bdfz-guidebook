window.angular_app = angular.module('bdfz-guidebook', [
	'ngCookies',
	'ngRoute', 
	'ngSanitize', 
	'ngResource', 
])
window.angular_app.config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    provider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
])