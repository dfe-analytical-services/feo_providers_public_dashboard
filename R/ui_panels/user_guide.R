user_guide_panel <- function() {
  tabPanel(
    "User guide",
    gov_main_layout(
      gov_row(
        column(
          12,
          heading_text("Further Education Outcomes Provider data dashboard", level = 1, size = "l"),
          heading_text("Introduction", level = 2, size = "m"),
          gov_text("This app gives users an interactive tool to access the provider data from DfE's Further Education Outcomes publication,
            which presents statistics on the employment, earnings and learning outcomes of further education learners."),
          heading_text("Context and purpose", level = 2, size = "m"),
          gov_text("This dashboard accompanies the Further Education Outcomes publication by the Department for Education, acting as
             an interactive tool to access outcomes data for individual providers."),
          gov_text("The data presented in this dashboard is only a subset of the full dataset provided in the publication."),
          gov_text(
            "The link to the most recent publication is here: ",
            external_link(
              href = "https://explore-education-statistics.service.gov.uk/find-statistics/further-education-outcomes/2022-23",
              "Further Education Outcomes 2022/23"
            ),
            "."
          ),
          heading_text("Guidance sources", level = 2, size = "m"),
          gov_text(
            "Full guidance is attached in the main publication page, with the methodology linked here: ",
            external_link(
              href = "https://explore-education-statistics.service.gov.uk/methodology/further-education-outcomes",
              "Further Education Outcomes methodology"
            ),
            "."
          ),
          heading_text("What are further education outcomes and what do they cover?", level = 2, size = "m"),
          gov_text("Further education outcomes (FEO) shows the percentage of further education
            learners going to or remaining in an education and/or employment destination
            in the academic year after achieving their learning aim. The most recent data
            reports on learners who achieved their aim in the 2022/23 academic year, and
            identifies their education and/or employment destinations the following year (2023/24). "),
          gov_text("This publication reports outcomes by various learner demographics and type
            and level of learning. Where a learner achieves more than one aim at the same
            provider within an academic year, the outcomes for the learner are reported
            against the highest and latest aim within that year. For example, if a learner
            achieves an aim at Level 2, and a separate Full Level 3 aim in the same
            academic year at the same provider, their destinations will be reported against
            the Full Level 3 aim. Full Level 2 and Full Level 3 are counted as higher than
            other Level 2 and Level 3 aims respectively, and apprenticeship aims are
            prioritised over education and training aims."),
          heading_text("What data is used?", level = 3, size = "s"),
          gov_text("The Longitudinal Education Outcomes (LEO) dataset is used, which looks at how
    learners move through education and into the labour market by bringing together:"),
          gov_list(
            c(
              "Schools, further and higher education information from the Department for Education (DfE)",
              "Employment information from HM Revenue and Customs (HMRC)",
              "Benefit histories from the Department of Work and Pensions (DWP)"
            )
          ),
          gov_text("All learner counts reported here relate to those learners for whom a match was found in the LEO data,
    therefore the counts will not match headline achievements in the FE & Skills National Statistics release."),
          heading_text("What further data is available?", level = 3, size = "s"),
          gov_text("In addition to the headline measures presented in this publication, further
            data is available on detailed destination, earnings and progression measures
            broken down by geographic areas, provider, learner demographics, type/level
            of learning completed and qualification title."),
          gov_text("A number of detailed breakdowns using this data have been signposted
          throughout the publication, and can also be accessed using the table builder
          tool which allows users to build custom tables. Alternatively, the underlying
          data files themselves can be downloaded from the ‘Data catalogue' section above."),
          gov_text("The outcomes reported in the commentary are presented as raw figures.
            They do not seek to control for differences in learner characteristics
            that may influence outcomes over time or across different learner populations."),
          heading_text("Rounding and suppression", level = 3, size = "s"),
          gov_text("Full details on rounding and suppression are available in the accompanying methodology documentation found
            on the publication website."),
          gov_text("Any percentage point (ppt) changes reported that appear to mismatch the percentages provided
            in the charts and tables are due to rounding conventions. The use of rounding and
            suppression may also mean that some charts do not appear to add up to 100%.")
        )
      )
    )
  )
}
