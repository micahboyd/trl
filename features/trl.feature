Feature: List
  In order to output text
  As a CLI

  Scenario: List Boards
    When I run `bundle exec exe/trl list`
    Then the output should contain "test"