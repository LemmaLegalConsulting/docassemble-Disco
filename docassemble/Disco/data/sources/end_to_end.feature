# Seeded with ALDashboard static fixture generator; reviewed against interview YAML.
@e2e
Feature: Complete Disco

  # The multiselect stores the XLSX ID 1 as a nested base64 Docassemble choice value.
  Scenario: One interrogatory response with an insufficient-inquiry objection
    Given I start the interview at "multiple_row_retrieval.yml"
    And the maximum seconds for each step is 120
    When I get to "download" with this data:
      | var | value | trigger |
      | methods['Interrogatory'] | True | |
      | objection_categories[i].ncr['1'] | True | objection_categories['Interrogatory'].ncr |
      | objection_categories[i].objections[j].selected | b2JqZWN0aW9uX2NhdGVnb3JpZXNbaV0ub2JqZWN0aW9uc1tqXS5zZWxlY3RlZFtSJ01RJ10 | objection_categories['Interrogatory'].objections['1'].selected |
    Then the question id should be "download"
    And I should see the phrase "Your form is ready to download."
    And I download "Disco.docx"
