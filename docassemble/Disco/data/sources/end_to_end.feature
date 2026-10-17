# Seeded with ALDashboard static fixture generator; reviewed against interview YAML.
@e2e
Feature: Complete Disco

  Scenario: One interrogatory response with an insufficient-inquiry objection
    Given I start the interview at "multiple_row_retrieval.yml"
    And the maximum seconds for each step is 120
    When I get to "download" with this data:
      | var | value |
      | methods['Interrogatory'] | True |
      | objection_categories['Interrogatory'].ncr[1] | True |
      | objection_categories['Interrogatory'].objections[1].selected[1] | True |
    Then the question id should be "download"
    And I should see the phrase "Your form is ready to download."
    And I download "Disco.docx"
