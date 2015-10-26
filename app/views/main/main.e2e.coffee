"use strict"

describe "test main page", ()->

    describe "when test framework is ng-scenario", ()->
        beforeEach ()->
            browser().navigateTo "/"

        it "get all menus and displayed correctly", ()->
