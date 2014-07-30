window.angular_app.controller 'ArticlesController', [
	'$scope',
	'$rootScope', 
	'$http', 
	'$cookies', 
	($scope, $rootScope, $http, $cookies) ->
		$scope.book_id = $('#angular_data').data('book-id')
		$scope.editor_init = false

		$http.get("/api/v1/article/get_list.json?id=#{$scope.book_id}", {},
				method: "GET",
				params:
					id: $('#angular_data').data('book-id')
				,isArray: true)
			.success (data, status, headers) ->
				$scope.articles = data

		$scope.get_info = () ->
			$http.get "/api/v1/article/get_info.json?id=#{$scope.article_id}",{},
					method: "GET",
					params:
						id: $scope.article_id
					,isArray: false
				.success (data, status, headers) ->
					$scope.article = data
					$scope.set_modal_value()
		$scope.show_update_modal = (evention) ->
			$scope.article_id = evention.target.getAttribute('data-article-id')
			$scope.get_info()
			$scope.modal_action = "更改"
			$('#article_modal').modal('show')
		$scope.set_modal_value = () ->
			window.editor = new Simditor
				textarea: $('.simditor')
				upload: true
				toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
			$scope.editor_init = true
			window.editor.setValue($scope.article.content)
		$scope.clear_editor = () ->
			window.editor.destroy()
			$scope.article.content = ""
		$scope.update_article = () ->
			$http 
					url: "/api/v1/article/update",
					method: 'POST',
					data:
						id: $scope.article_id,
						article:
							title: $('input#title').val(),
							order: $('input#order').val(),
							content: window.editor.getValue()
					,isArray: false
				.success () ->
					$('#article_modal').modal('hide')
			
			

]