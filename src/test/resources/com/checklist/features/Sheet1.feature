
@feature_ProposalSearch
Feature: Sheet1

Background: User is on the Search Page
  Given the user is logged into the application and Search page is open

@validateNaturalLanguageSearchForProposalId
Scenario: Validate natural language search for Proposal ID
  Given the user navigates to the browse or search proposal table
  When the user enters a valid Proposal ID 231235 in the search box
  And the user presses Enter or clicks the magnifying glass icon
  Then the search box should accept the input and initiate the search
  And exact match results should be displayed at the top of the table
  And partial matches should be displayed below exact matches

@negativeSearchInvalidProposalID
Scenario: Search with invalid Proposal ID
    Given the user navigates to the browse or search proposal table
    When the user enters an invalid Proposal ID abc123 in the search box
    And the user presses Enter or clicks the magnifying glass icon
    Then the search box should accept the input
    And no results should be displayed, or an error message should be shown
    And the user should be provided with an option to refine the search

@ValidateTooltipPresence
Scenario: Validate tooltip presence in search box
    Given the user navigates to the browse or search proposal table
    When the user hovers over the search box on the far right
    Then the tooltip should be displayed when hovering over the search box
    And the tooltip should accurately describe available search options
    And the tooltip should disappear when not hovering

@scenario_AddChemical
Scenario: Add Acid/Additives
    Given the user enters a valid email address into the Email Address input field
    And the user enters a valid password into the Password input field
    When the user clicks on the Submit button
    And the user clicks on the Jobs sidebar
    And the user clicks on Table
    And the user clicks on Set as Current Job
    And the user clicks on Set as Current Well
    And the user clicks on Set as Current Stage
    And the user clicks on View Detail on Chemicals tab
    And the user clicks on Add Acid/Additives button
    And the user clicks on name dropdown
    And the user selects an option from the name dropdown
    And the user enters a numeric value into the Design Concentration input field
    And the user enters a numeric value into the Designed Volume per Stage input field
    Then the user clicks on Add button
