support_panel <- function() {
  layout_columns(
    col_widths = c(-2, 8, -2),

    # Add in back link
    actionLink(
      class = "govuk-back-link",
      style = "margin: 0",
      "support_to_dashboard",
      "Back to dashboard"
    ),
    dfeshiny::support_panel(
      team_email = " FE.OUTCOMESDATA@education.gov.uk",
      repo_name = "https://github.com/dfe-analytical-services/feo_providers_public_dashboard",
      publication_name = "Further education outcomes",
      publication_slug = "further-education-outcomes",
      form_url = "https://forms.office.com"
    )
  )
}
