angular.module('project', ['mongolab'])
  .config(
    ($routeProvider) ->
      $routeProvider
        .when('/statistic', {
          controller: EditCtrl,
          templateUrl: 'statistic.html'

        }).when('/edit/:projectId', {
          controller: EditCtrl,
          templateUrl: 'detail.html'

        }).when('/new', {
          controller: CreateCtrl,
          templateUrl: 'detail.html'

        }).otherwise({
          redirectTo: '/statistic'
        })
      @
  )

CreateCtrl = ($scope, $location, Project) ->
  @
