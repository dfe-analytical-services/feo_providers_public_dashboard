accessibility_panel <- function() {
  layout_columns(
    col_widths = c(-2, 8, -2),

    # Add in back link
    actionLink(
      class = "govuk-back-link",
      style = "margin: 0",
      "accessibility_to_dashboard",
      "Back to dashboard"
    ),
    dfeshiny::a11y_panel(
      dashboard_title = site_title,
      dashboard_url = site_primary,
      date_tested = "12th June 2025",
      date_prepared = "12th June 2025",
      date_reviewed = "12th June 2025",
      issues_contact = "explore.statistics@education.gov.uk",
      non_accessible_components = c(
        "List non-accessible components here"
      ),
      specific_issues = c(
        "Some combinations of filters are not existent in the underlying data.
                              Therefore, when using this dashboard you may find an error message that
                              either indicates there are simply no learners that meet your specific criteria
                              or the combination of filters you've chosen does not exist in the current data.
                              Please change the filters to look at existing data held in the current publication."
      )
    )
  )
}
