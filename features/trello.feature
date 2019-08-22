Feature: List
  In order to output text
  As a CLI

  Scenario: List test
    When I run `trello list`
    Then the output should contain "test"