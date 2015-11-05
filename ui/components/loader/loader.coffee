"use strict"

angular.module "ss.components"
.provider "ssLoading", ()->
    defaultText= 'Loading, please wait...'
    @text = defaultText
    _this = @
    @$get = ["$timeout", "$q", "$document", ($timeout, $q, $document)->
        return (obj, txt)->
            if txt
                _this.text = txt
            #template = "<div class = 'ui segment'><div class = 'ui active dimmer'><div class='ui medium text loader'></div></div><p></p><p></p><p></p></div>"
            template = "<div class='ss-loader-container'><div class='ui active centered inline inverted loader' style='position: absolute;top: 50%;left: 50%;'></div></div>"
            elem = angular.element template
            body = $document.find('body').eq(0)
            timeoutPromise = $timeout ()->
                body.append elem
            ,0
            return $q.all(obj)["finally"] ()->
                $timeout.cancel timeoutPromise
                elem.remove()
                _this.text = defaultText
    ]
    return @
