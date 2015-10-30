"use strict"

serverAddress = "http://localhost:8080/#/"

describe "login scenario", ()->
    email = "sissy.li@software.dell.com"
    password = "Pa$$word"

    it "should locate to login page when click login link", ()->
        browser.get serverAddress
        browser.waitForAngular()
        element(By.css ".ss-home").$("a").click()
        expect(browser.getLocationAbsUrl()).toBe serverAddress + "login"

    it "should locate to sign up page when create an count", ()->
        element(By.id "ss-create-account-button").click()
        browser.waitForAngular()
        expect(browser.getLocationAbsUrl()).toBe serverAddress + "register"

    it "should locate to login page when sign up", ()->
        element(By.model "email").sendKeys email
        element(By.model "password").sendKeys password
        element(By.id "ss-register-submit-button").click()

        expect(browser.getLocationAbsUrl()).toBe serverAddress + "login"

    it "should locate to dashboard page when login in", ()->
        element(By.model "email").sendKeys email
        element(By.model "password").sendKeys password
        element(By.css ".ss-login-button").click()

        expect(element.all(By.css ".ss-top").count()).toBe 1

    it "should display menus and user info when locate to dashboard page", ()->
        expect(element.all(By.css ".ss-pointer-hover").count()).toBe 3

        element(By.css ".header.ss-pointer-hover").click()
        browser.waitForAngular()

        expect(element.all(By.id "ss-expand-menus").count()).toBe 2

    it "should locate to user page", ()->
        element(By.css ".header.ss-pointer-hover").click()
        element.all(By.id "ss-expand-menus").first().click()
        element(By.id "ss-user-page-link").click()
        browser.sleep 2000

        expect(browser.getLocationAbsUrl()).toBe serverAddress + "user"

    it "should display deal section info", ()->
        browser.get serverAddress + "user"
        browser.waitForAngular()
        element(By.id "ss-user-page-section").all(By.css ".item").get(1).click()
        browser.waitForAngular()

        expect(element.all(By.css ".ss-user-content").count()).toBe 1




