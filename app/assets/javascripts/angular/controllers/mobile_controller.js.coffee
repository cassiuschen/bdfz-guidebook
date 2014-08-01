window.MobileController = angular.module 'mobile.controllers', []

window.MobileController
  .controller 'BooksController', ['$scope', '$http', ($scope, $http) -> 
    $scope.get_list = () ->
      $http
          url: '/api/v1/book/get_list.json',
          method: 'GET',
          isArray: true
        .success (data) ->
          $scope.books = data
    $scope.get_list()
    $scope.refresh = () ->
      $scope.get_list()
      
  ]

  .controller 'BookDetailController', ['$scope', '$stateParams', '$http', ($scope, $stateParams, $http) ->
    $scope.get_list = () ->
      $http
          url: '/api/v1/article/get_list.json',
          params:
            id: $stateParams.BookId
          ,isArray: true
        .success (data) ->
          $scope.articles = data
    $scope.get_list()
    $scope.refresh = () ->
      $scope.get_list()
    ]

  .controller 'AboutController', ['$scope', '$http', ($scope, $http) -> 
  ]

  .controller 'HomeController', ['$scope', '$http', ($scope, $http) -> 
    $http
        url: '/api/v1/mobile/last_update.json',
        method: 'GET',
        isArray: false
      .success (data) ->
        $scope.version = data.version
  ]

  .controller 'ArticleController', ['$scope', '$http', ($scope, $http) -> 
  ]

  .controller 'SideMenuController', [
    '$scope',
    '$ionicSideMenuDelegate',
    '$rootScope',
    '$http',
    ($scope, $ionicSideMenuDelegate, $rootScope, $http) ->
      $rootScope.SideBarTitle = "北大附中学生手册"
      $scope.toggleLeft = () ->
          $ionicSideMenuDelegate.toggleLeft()
  ]