@guide_authors
Feature: Guide Authors
  In order to have guide_authors on my website
  As an administrator
  I want to manage guide_authors

  Background:
    Given I am a logged in refinery user
    And I have no guide_authors

  @guide_authors-list @list
  Scenario: Guide Authors List
   Given I have guide_authors titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of guide_authors
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @guide_authors-valid @valid
  Scenario: Create Valid Guide Author
    When I go to the list of guide_authors
    And I follow "Add New Guide Author"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 guide_author

  @guide_authors-invalid @invalid
  Scenario: Create Invalid Guide Author (without name)
    When I go to the list of guide_authors
    And I follow "Add New Guide Author"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 guide_authors

  @guide_authors-edit @edit
  Scenario: Edit Existing Guide Author
    Given I have guide_authors titled "A name"
    When I go to the list of guide_authors
    And I follow "Edit this guide_author" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of guide_authors
    And I should not see "A name"

  @guide_authors-duplicate @duplicate
  Scenario: Create Duplicate Guide Author
    Given I only have guide_authors titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of guide_authors
    And I follow "Add New Guide Author"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 guide_authors

  @guide_authors-delete @delete
  Scenario: Delete Guide Author
    Given I only have guide_authors titled UniqueTitleOne
    When I go to the list of guide_authors
    And I follow "Remove this guide author forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 guide_authors
 