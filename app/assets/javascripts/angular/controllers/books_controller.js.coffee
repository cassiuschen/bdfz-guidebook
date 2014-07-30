window.angular_app.controller 'BooksController', [
	'$scope',
	'$rootScope', 
	'$http', 
	'$cookies', 
	($scope, $rootScope, $http, $cookies) ->
		$scope.is_update = true

		$http.get("/api/v1/book/get_list.json", {},
				method: "GET"
				,isArray: true)
			.success (data, status, headers) ->
				$scope.books = data

		$scope.get_info = () ->
			$http
					method: 'GET',
					url: '/api/v1/book/info.json',
					params:
						id: $scope.book_id
					,isArray: false
				.success (data) ->
					$scope.book = data 

		$scope.update_list = () ->
			$scope.articles = []
			$http.get("/api/v1/book/get_list.json", {},
					method: "GET"
					,isArray: true)
				.success (data, status, headers) ->
					$scope.books = data

		$scope.show_create_modal = () ->
			$scope.modal_action = "创建"
			$scope.is_update = false
			$scope.book_title = ""
			$('#book_modal').modal('show')

		$scope.show_update_modal = (evention) ->
			$scope.book_id = evention.target.getAttribute('data-book-id')
			$scope.get_info()
			$scope.is_update = true
			$scope.modal_action = "更改"
			$('#book_modal').modal('show')

		$scope.update_book = () ->
			$http 
					url: "/api/v1/book/update",
					method: 'POST',
					data:
						id: $scope.book_id,
						book:
							title: $('input#title').val(),
					,isArray: false
				.success () ->
					$scope.update_list()
					$('#book_modal').modal('hide')
		$scope.create_book = () ->
			$http 
					url: "/api/v1/book/new",
					method: 'POST',
					data:
						id: $scope.book_id,
						book:
							title: $('input#title').val(),
					,isArray: false
				.success (data) ->
					if data.status == "success"
						$scope.update_list()
						$('#book_modal').modal('hide')
]