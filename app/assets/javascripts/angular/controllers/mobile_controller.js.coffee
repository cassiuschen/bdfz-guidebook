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

  .controller 'BookDetailController', ['$scope', '$stateParams', '$http', '$rootScope', ($scope, $stateParams, $http, $rootScope) ->
    $scope.get_list = () ->
      $http
          url: '/api/v1/article/get_list.json',
          params:
            id: $stateParams.BookId
          ,isArray: true
        .success (data) ->
          $scope.articles = data
    $scope.get_book = () ->
      $http
          url: '/api/v1/book/info.json',
          params:
            id: $stateParams.BookId
          ,isArray: false
        .success (data) ->
          $rootScope.book = data
    $scope.get_list()
    $scope.get_book()
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

  .controller 'ArticleController', ['$scope', '$http', '$stateParams', '$ionicPlatform', ($scope, $http, $stateParams, $ionicPlatform) ->
    $scope.get_article = () ->
      $http
          url: '/api/v1/article/get_info.json',
          params:
            id: $stateParams.ArticleId
          ,isArray: false
        .success (data) ->
          $scope.article = data
    $scope.get_book = () ->
      $http
          url: '/api/v1/book/info.json',
          params:
            id: $stateParams.Book_Id
          ,isArray: false
        .success (data) ->
          $scope.book = data
    $scope.get_book()
    $scope.get_article()
    $ionicPlatform.ready () ->
      $('img').addClass("full-image");
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