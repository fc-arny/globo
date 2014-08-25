angular.module('gm.store.directives', [])
  .directive('goodItem', ->
    restrict: 'EA'
    scope:
      item: '='
    transclude: 'element'
    multiElement: true
#    replace : true
#    template: '<div ng-transclude></div>'
#    compile: goodItemCompile = ($element, $attr)->

    link: (scope, element, attrs) ->
      console.log scope.item

  )