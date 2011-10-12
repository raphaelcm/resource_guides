@resource_guides
Feature: Resource Guides
  In order to have resource_guides on my website
  As an administrator
  I want to manage resource_guides

  Background:
    Given I am a logged in refinery user
    And I have no resource_guides

  @resource_guides-list @list
  Scenario: Resource Guides List
   Given I have resource_guides titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of resource_guides
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @resource_guides-valid @valid
  Scenario: Create Valid Resource Guide
    When I go to the list of resource_guides
    And I follow "Add New Resource Guide"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 resource_guide

  @resource_guides-invalid @invalid
  Scenario: Create Invalid Resource Guide (without title)
    When I go to the list of resource_guides
    And I follow "Add New Resource Guide"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 resource_guides

  @resource_guides-edit @edit
  Scenario: Edit Existing Resource Guide
    Given I have resource_guides titled "A title"
    When I go to the list of resource_guides
    And I follow "Edit this resource_guide" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of resource_guides
    And I should not see "A title"

  @resource_guides-duplicate @duplicate
  Scenario: Create Duplicate Resource Guide
    Given I only have resource_guides titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of resource_guides
    And I follow "Add New Resource Guide"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 resource_guides

  @resource_guides-delete @delete
  Scenario: Delete Resource Guide
    Given I only have resource_guides titled UniqueTitleOne
    When I go to the list of resource_guides
    And I follow "Remove this resource guide forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 resource_guides
 