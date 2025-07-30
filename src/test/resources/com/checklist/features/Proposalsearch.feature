
@feature_proposalsearch
Feature: Proposalsearch

Background: User is on the Proposal Search Page
  Given the user is on the Proposal Search Page

@valid-search-by-proposal-id
Scenario Outline: Valid search by Proposal ID
  Given the user is on the 'Browse or Search Proposal' table
  When the user enters "<proposal_id>" in the search box
  And the user clicks the magnifying glass icon to initiate the search
  Then the exact matched proposal should be displayed at the top of the results

  Examples:
    | proposal_id |
    | 231235      |

@invalid-proposal-id-search
Scenario Outline: Invalid Proposal ID search
  Given the 'Browse or Search Proposal' table is visible
  When I enter "<proposal_id>" in the search box
  And I click the magnifying glass icon to initiate the search
  Then no matching proposals should be displayed in the search results

  Examples:
    | proposal_id |
    | abc123      |

@edge-case-proposal-id-search
Scenario Outline: Edge case for Proposal ID search
  Given the user is on the Proposal Search Page
  When the user navigates to the 'Browse or Search Proposal' table
  And the user enters a Proposal ID "<proposal_id>" in the search box
  And the user clicks the magnifying glass icon to initiate the search
  Then appropriate search results should be displayed based on the boundary value entered

  Examples:
    | proposal_id |
    | 999999      |
