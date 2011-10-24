@guide_categories
Feature: Guide Categories
  In order to have guide_categories on my website
  As an administrator
  I want to manage guide_categories

  Background:
    Given I am a logged in refinery user
    And I have no guide_categories

  @guide_categories-list @list
  Scenario: Guide Categories List
   Given I have guide_categories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of guide_categories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @guide_categories-valid @valid
  Scenario: Create Valid Guide Category
    When I go to the list of guide_categories
    And I follow "Add New Guide Category"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 guide_category

  @guide_categories-invalid @invalid
  Scenario: Create Invalid Guide Category (without name)
    When I go to the list of guide_categories
    And I follow "Add New Guide Category"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 guide_categories

  @guide_categories-edit @edit
  Scenario: Edit Existing Guide Category
    Given I have guide_categories titled "A name"
    When I go to the list of guide_categories
    And I follow "Edit this guide_category" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of guide_categories
    And I should not see "A name"

  @guide_categories-duplicate @duplicate
  Scenario: Create Duplicate Guide Category
    Given I only have guide_categories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of guide_categories
    And I follow "Add New Guide Category"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 guide_categories

  @guide_categories-delete @delete
  Scenario: Delete Guide Category
    Given I only have guide_categories titled UniqueTitleOne
    When I go to the list of guide_categories
    And I follow "Remove this guide category forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 guide_categories
 