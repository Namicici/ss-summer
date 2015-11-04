"use strict"

angular.module "ss.components"

.directive "outsideClick", ['$document','$parse', ($document, $parse)->
    link: ($scope, $element, $attributes)->
        onDocumentClick = (event)->
            isChild = false
            children = $element.children(event.target)
            for child in children
                if child == event.target
                    isChild = true
                    return
            isSelf = $element[0] == event.target
            isInside = isChild || isSelf

            if !isInside
                $scope.$apply $attributes.outsideClick

        $document.on "click", onDocumentClick

        $element.on '$destroy', ()->
            $document.off "click", onDocumentClick
]
