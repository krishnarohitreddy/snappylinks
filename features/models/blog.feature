Feature: Submit feedback
    In order to submit the feedback form
    you have to fill in all the three fields

    Scenario: Create a valid feedback form
    Given I have a blog
    When I go to "feedback"
    And I fill in "name" with "rohit"
    And I fill in "email" with "krishnarod@gmail.com"
    And I fill in "message" with "this is a message"
    Then I should see "New feedback created"