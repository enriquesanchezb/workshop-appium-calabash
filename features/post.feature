Feature: Post

  Background:
    Given I am about to login
    When I enter valid credentials

  @valid
  Scenario: Add a new post
    When I create a valid post
    Then The new post is posted

    Scenario Outline: bbb
      Given I am a logged user
      When I create a invalid post when title <Title>
      Then The new post is not posted
      Examples:
        |Title|
      |ghvbhdfs|


  @valid
  Scenario: Modify a post
    When I modify an existing post
    Then The post is modified

  @valid
  Scenario: Delete a post
    When I modify an existing post
    Then The post is modified