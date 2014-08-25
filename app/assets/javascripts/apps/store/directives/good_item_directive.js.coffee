angular.module('gm.store.directives', [])
  .directive('goodItem', ->
    restrict: 'EA'
    scope:
      item: '='
    transclude: true
#    replace : true
#    compile: (tElement, tAttr, transclude)->
#      ($scope)->
#        transclude($scope, (clone)->
#          tElement.append clone
#        )


    link: (scope, element, attrs, ctrl, transclude) ->
      transclude(scope, (clone)->
        element.append clone
      )

  )