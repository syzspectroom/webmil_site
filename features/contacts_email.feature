Feature: Sending contacts form

Background:
Given no emails have been sent

Scenario: Person sends email
	Given I have sent email from contacts page
    And "info@webmil.com.ua" should receive an email with the following body: "name: message"