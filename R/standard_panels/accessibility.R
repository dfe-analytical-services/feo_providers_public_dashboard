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
      date_tested = "23rd April 2026",
      date_prepared = "23rd April 2026",
      date_reviewed = "23rd April 2026",
      issues_contact = "fe.outcomesdata@education.gov.uk",
      specific_issues = c(
        "Elements with an ARIA [role] that require children to contain a specific [role] are missing some or all of those required children.",
        "List items (<li>) are not contained within <ul>, <ol> or <menu> parent elements.",
        "Cells in a <table> element that use the [headers] attribute refer to an element id not found within the same table.",
        "Some combinations of filters are not existent in the underlying data.
                              Therefore, when using this dashboard you may find an error message that
                              either indicates there are simply no learners that meet your specific criteria
                              or the combination of filters you've chosen does not exist in the current data.
                              Please change the filters to look at existing data held in the current publication."
      )
    )
  )
}
