
@feature_sales
Feature: Sales

Background: User is on the Sales Page
  Given the user is on the Sales Page

@verify-search-by-company-name-with-valid-input
Scenario Outline: Verify search by Company name with valid input
  Given the user is on the Sales Page
  When I select "Company name" from the category dropdown
  And I type "<company_name>" into the search field
  And I observe the dropdown for relevant options
  And I select the matching company from the options
  And I submit the search
  Then the leads list should display correctly filtered results

  Examples:
    | company_name  |
    | abcd pvt.ltd  |

@verify-search-by-contact-person-with-valid-input
Scenario Outline: Verify search by Contact person with valid input
  Given the user is on the Sales Page
  When I select "Contact person" from the category dropdown
  And I type "<contact_person_name>" into the search field
  And I observe the dropdown for relevant options
  And I select the matching contact from the options
  And I submit the search
  Then the leads list should display correctly filtered results

  Examples:
    | contact_person_name |
    | krishna             |

@verify-search-by-status-with-multiple-selections
Scenario Outline: Verify search by Status with multiple selections
  Given the user is on the Leads Page
  When the user selects "Status" from the category dropdown
  And the user checks multiple status options using checkboxes
  And the user submits the search
  Then the leads list should display correctly filtered results based on selected statuses

  Examples:
    | status1 | status2 |
    | Active  | Closed  |
    | Pending | Lost    |

@filter-leads-by-1-month-ago
Scenario Outline: Verify filter leads by "1 month ago"
  Given the user is on the Leads Page
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the leads list should display correctly filtered results from the past month

  Examples:
    | time_period  |
    | 1 month ago  |

@filter-leads-3-months
Scenario Outline: Verify filter leads by "3 months ago"
  Given the user is on the Sales Leads Page
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the leads list should display correctly filtered results from the past three months

  Examples:
    | time_period   |
    | 3 months ago  |

@verify-filter-leads-by-12-months-ago
Scenario Outline: Verify filter leads by "12 months ago"
  Given the user is on the Leads Page
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the leads list should display correctly filtered results from the past year

  Examples:
    | time_period     |
    | 12 months ago   |

@verify-filter-leads-by-month-to-date
Scenario Outline: Verify filter leads by "Month to Date"
  Given the user is on the Leads Page
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the leads list should display correctly filtered results from the start of the current month to present

  Examples:
    | time_period   |
    | Month to Date |

@verify-filter-leads-by-year-to-date
Scenario Outline: Verify filter leads by "Year to Date"
  Given the user is on the Leads Page
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the leads list should display correctly filtered results from the start of the current year to present

  Examples:
    | time_period     |
    | Year to Date    |

@verify-default-selection-of-company-name-in-category-dropdown
Scenario Outline: Verify default selection of "Company name" in category dropdown
  Given the user is on the Leads Record Screen
  When the user observes the category dropdown
  Then "Company name" should be selected by default in the category dropdown

  Examples:
    |  |

@verify-options-company-name
Scenario Outline: Verify relevant options appear when typing in "Company name" field
  Given the user is on the Sales Page
  When the user selects "Company name" from the category dropdown
  And the user types "<company_name>" in the search field
  Then relevant company names should appear in the dropdown based on typed characters

  Examples:
    | company_name |
    | abc          |

@verify-contact-person-options
Scenario Outline: Verify relevant options appear when typing in "Contact person" field
  Given the user is on the Sales Page
  When the user selects "Contact person" from the category dropdown
  And the user types "<contact_person_name>" in the search field
  Then relevant contact names should appear in the dropdown based on typed characters

  Examples:
    | contact_person_name |
    | kr                  |

@verify-multiple-status-selection-functionality
Scenario Outline: Verify multiple status selection functionality
  Given the user is on the Sales Page
  When I select "<category>" from the category dropdown
  And I check the "<status1>" and "<status2>" status checkboxes
  And I submit the search
  Then the leads list should display correctly filtered results based on selected statuses

  Examples:
    | category | status1 | status2   |
    | Status   | New     | Contacted |

@verify-single-status-selection-functionality
Scenario Outline: Verify single status selection functionality
  Given the user is on the Leads Page
  When the user selects <category> from the category dropdown
  And the user checks the <status> status checkbox
  And the user submits the search
  Then the leads list should display correctly filtered results based on selected status

  Examples:
    | category | status    |
    | Status   | Qualified |

@verify-search-functionality-resets
Scenario Outline: Verify search functionality resets after clearing input
  Given the user selects "Company name" from the category dropdown
  When the user types "<company_name>" into the search field
  And the user clears the input field
  And the user submits the search
  Then the leads list should display unfiltered results

  Examples:
    | company_name  |
    | abcd pvt.ltd  |

@verify-search-functionality-persists
Scenario Outline: Verify search functionality persists after navigating away and back
  Given the user is on the Leads Record Screen
  When the user performs a search by "<search_term>"
  And the user navigates to a different screen
  And the user returns to the Leads Record Screen
  Then the previous search input and results should persist

  Examples:
    | search_term    |
    | Contact person |

@verify-search-functionality-no-results
Scenario Outline: Verify search functionality when no matching results found
  Given the user is on the Sales Page
  When the user selects "Company name" from the category dropdown
  And the user types "<company_name>" in the search field
  And the user submits the search
  Then the search results should show no matching leads

  Examples:
    | company_name         |
    | nonexistent company  |

@verify-ui-feedback-on-successful-search-submission
Scenario Outline: Verify UI feedback on successful search submission
  Given the user is on the Sales Page
  When the user selects <category> from the category dropdown
  And the user checks the <status> status checkbox
  And the user submits the search
  Then the UI feedback indicates successful search submission

  Examples:
    | category | status |
    | Status   | New    |

@verify-ui-feedback-on-successful-filter-application
Scenario Outline: Verify UI feedback on successful filter application
  Given the user is on the Sales Dashboard
  When the user selects "<time_period>" from the time period dropdown
  And the user applies the filter
  Then the UI feedback indicates successful filter application

  Examples:
    | time_period    |
    | Year to Date   |

@verify-search-functionality-with-mixed-category-and-status-filters
Scenario Outline: Verify search functionality with mixed category and status filters
  Given the user is on the Leads Page
  When I select "Company name" from the category dropdown
  And I type "<company_name>" in the search field
  And I select "Status" from the category dropdown
  And I check the "Closed-Lost" status checkbox
  And I submit the search
  Then the leads list should display correctly filtered results based on company name and status

  Examples:
    | company_name  |
    | abcd pvt.ltd  |

@verify-ui-accessibility-category-dropdown
Scenario Outline: Verify UI accessibility of category dropdown
  Given the user is on the Leads Record Screen
  When the user focuses on the category dropdown using keyboard navigation
  Then the category dropdown should be accessible via keyboard navigation

  Examples:
    | placeholder |
    | value       |

@verify-ui-accessibility-of-search-field
Scenario Outline: Verify UI accessibility of search field
  Given the user is on the Leads Record Screen
  When the user navigates to the leads record screen
  And the user focuses on the search field using keyboard navigation
  Then the search field should be accessible via keyboard navigation

  Examples:
    | action |
    | navigate |

@verify-ui-accessibility-of-time-period-dropdown
Scenario Outline: Verify UI accessibility of time period dropdown
  Given the user is on the Leads Record Screen
  When the user focuses on the time period dropdown using keyboard navigation
  Then the time period dropdown should be accessible via keyboard navigation

  Examples:
    | action |
    | navigate |

@verify-ui-feedback-no-leads-match-filter
Scenario Outline: Verify UI feedback when no leads match the applied filter
  Given the user is on the Leads Page
  When the user selects <category> from the category dropdown
  And the user checks the <status> status checkbox
  And the user applies a filter for <filter>
  Then the UI feedback indicates no leads match the applied filter

  Examples:
    | category | status             | filter      |
    | Status   | Closed-Unqualified | 1 month ago |

@verify-search-by-invalid-company-name-input
Scenario Outline: Verify search by invalid Company name input
  Given the user is on the Sales Page
  When I select "Company name" from the category dropdown
  And I type "<company_name>" into the search field
  And I submit the search
  Then the search results should show no matching leads

  Examples:
    | company_name |
    | xyz123       |

@verify-search-by-invalid-contact-person-input
Scenario Outline: Verify search by invalid Contact person input
  Given the user is on the Sales Page
  When the user selects "Contact person" from the category dropdown
  And the user types "<contact_person_name>" into the search field
  And the user submits the search
  Then the search results should show no matching leads

  Examples:
    | contact_person_name |
    | abc123              |
    | !@#$%^&*            |

@verify-search-by-invalid-status-input
Scenario Outline: Verify search by invalid Status input
  Given the user selects "Status" from the category dropdown
  When the user attempts to check an invalid status option "<status>"
  Then the invalid status option cannot be checked

  Examples:
    | status    |
    | !@#$%^&*  |

@filter-leads-by-invalid-time-period
Scenario Outline: Verify filter leads by invalid time period
  Given the user is on the Leads Page
  When the user attempts to select "<time period>" from the time period dropdown
  Then the invalid time period option cannot be selected

  Examples:
    | time period |
    | abc123      |

@empty-search-field-submission
Scenario Outline: Verify system behavior with empty search field submission
  Given the user is on the Sales Page
  When the user leaves the search field empty
  And the user submits the search
  Then the system should reject the empty search field or prompt for input

  Examples:
    | search field |
    | " "          |

@empty-filter-field-submission
Scenario Outline: Verify system behavior with empty filter field submission
  Given the user is on the Sales Page
  When the user leaves the time period dropdown unselected
  And the user applies the filter
  Then the unselected dropdown is rejected or prompts for selection

  Examples:
    | time period |
    |             |

@verify-system-behavior-empty-fields
Scenario Outline: Verify system behavior when attempting to search with both fields empty
  Given the user is on the Sales Page
  When I leave the <search field> empty
  And I leave the <filter field> empty
  And I submit the search
  Then the system should reject the empty fields or prompt for input

  Examples:
    | search field | filter field |
    |              |              |

@verify-search-functionality-with-special-characters-in-input
Scenario Outline: Verify search functionality with special characters in input
  Given the user is on the Sales Page
  When I select "Company name" from the category dropdown
  And I type "<company_name>" into the search field
  And I submit the search
  Then special characters are rejected or sanitized
  And search results show no matching leads

  Examples:
    | company_name |
    | !@#$%^&*     |

@verify-search-functionality-with-excessively-long-input
Scenario Outline: Verify search functionality with excessively long input
  Given the user is on the Sales Page
  When the user selects "Contact person" from the category dropdown
  And the user types "<search_field>" into the search field
  And the user submits the search
  Then the search results should show no matching leads

  Examples:
    | search_field |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

@no-category-selected
Scenario Outline: Verify system behavior when no category is selected and search is submitted
  Given the user is on the Sales Page
  When I clear category selection
  And I submit the search
  Then the search is rejected or prompts for category selection

  Examples:
    | category |
    |          |

@verify-invalid-status-checkbox-selection
Scenario Outline: Verify system behavior with invalid status checkbox selection
  Given the user is on the Sales Page
  When the user selects "<category>" from the category dropdown
  And the user attempts to check a nonexistent status option
  Then the nonexistent status option cannot be checked

  Examples:
    | category |
    | Status   |

@invalid-category-selection
Scenario Outline: Verify invalid category selection behavior
  Given the user is on the Sales Page
  When the user attempts to select a nonexistent category from the dropdown
  Then the nonexistent category cannot be selected

  Examples:
    | nonexistent_category |
    | InvalidCategory      |

@invalid-time-period-selection
Scenario Outline: Verify invalid time period selection behavior
  Given the user is on the Sales Page
  When the user attempts to select "<time period>" from the dropdown
  Then the "<time period>" cannot be selected

  Examples:
    | time period         |
    | nonexistent period  |

@verify-invalid-input
Scenario Outline: Verify invalid input in both search and filter fields
  Given the user is on the Sales Page
  When the user selects "<company_name>" from the category dropdown
  And the user types invalid characters "<invalid_characters>" into the search field
  And the user attempts to select an invalid time period "<invalid_time_period>"
  And the user submits the search
  Then the search should be rejected or prompt for valid input

  Examples:
    | company_name | invalid_characters | invalid_time_period |
    | xyz123       | xyz123             | !@#$%^&*            |

@verify-system-behavior-when-attempting-to-apply-filter-with-no-leads
Scenario Outline: Verify system behavior when attempting to apply filter with no leads
  Given the user is on the Leads Page
  When the user selects "<category>" from the category dropdown
  And the user checks the "<status>" status checkbox
  And the user applies a filter for a <time_period> time period
  Then the <time_period> time period cannot be selected

  Examples:
    | category | status             | time_period |
    | Status   | Closed-Unqualified | Nonexistent |




