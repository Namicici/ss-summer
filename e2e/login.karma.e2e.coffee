angular.scenario.dsl "browserLocalStorage", ()->
    chain = {}
    chain.clear = ()->
        return this.addFutureAction "clear local storage", ($window, $document, done)->
            $window.localStorage.clear()
            done()

    chain.setItem = (key, value)->
        return this.addFutureAction "set local storage item", ($window, $document, done)->
            $window.localStorage.setItem(key, value)
            done()
    ()->
        chain

email = "sissy.li@software.dell.com"
password = "Pa$$word"

describe "login in scenerio", ()->
    it "should locate to login page when click login link", ()->
        browser().navigateTo "/"
        element(".ss-home a").click()
        expect(browser().location().path()).toBe "/login"

    it "should locate to sign up page when create an count", ()->
        element("#ss-create-account-button").click()
        expect(browser().location().path()).toBe "/register"

    it "should locate to login page when sign up", ()->
        input("email").enter email
        input("password").enter password
        element("#ss-register-submit-button").click()

        expect(browser().location().path()).toBe "/login"

    it "should locate to login page when no user info in local storage", ()->
        expect(browser().location().path()).toBe "/login"

    it "should locate to main page when login successfully", ()->
        input("email").enter email
        input("password").enter password
        element(".ss-login-button").click()
        expect(browser().location().path()).toBe "/dashboard"

    it "should display menus in main page", ()->
        expect(element(".ss-pointer-hover").count()).toBe 3
        element(".header.ss-pointer-hover:eq(0)").click()
        expect(element("#ss-expand-menus").count()).toBe 1

    it "should locate to user page", ()->
        element(".header.ss-pointer-hover:eq(0)").click()
        element("#ss-expand-menus:eq(0)").click()
        element("#ss-user-page-link").click()

        expect(browser().location().path()).toBe  "/user"

    it "should display deal section info", ()->
        browser().navigateTo "/user"
        element("#ss-user-page-section .item:eq(1)").click()

        expect(element(".ss-user-content").count()).toBe 1
