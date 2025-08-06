user_guide_panel <- function() {
  tabPanel(
    "User guide",
    gov_main_layout(
      gov_row(
        column(
          12,
          h1("Further Education Outcomes Provider data dashboard"),
          h2("Introduction"),
          p("This app gives users an interactive tool to access the provider data from DfE's Further Education Outcomes publication,
            which presents statistics on the employment, earnings and learning outcomes of further education learners."),
          h2("Context and purpose"),
          p("This dashboard accompanies the Further Education Outcomes publication by the Department for Education, acting as
             an interactive tool to access outcomes data for individual providers."),
          p("The data presented in this dashboard is only a subset of the full dataset provided in the publication."),
          p(
            "The link to the most recent publication is here: ",
            tags$a(
              href = "https://explore-education-statistics.service.gov.uk/find-statistics/further-education-outcomes/2021-22",
              "Further Education Outcomes 2021/22",
              target = "_blank"
            ),
            "."
          ),
          h2("Guidance sources"),
          p(
            "Full guidance is attached in the main publication page, with the methodology linked here: ",
            tags$a(
              href = "https://explore-education-statistics.service.gov.uk/methodology/further-education-outcomes",
              "Further Education Outcomes methodology",
              target = "_blank"
            ),
            "."
          ),
          h2("What are further education outcomes and what do they cover?"),
          p("Further education outcomes (FEO) shows the percentage of further education
            learners going to or remaining in an education and/or employment destination
            in the academic year after achieving their learning aim. The most recent data
            reports on learners who achieved their aim in the 2021/22 academic year, and
            identifies their education and/or employment destinations the following year (2022/23). "),
          p("This publication reports outcomes by various learner demographics and type
            and level of learning. Where a learner achieves more than one aim at the same
            provider within an academic year, the outcomes for the learner are reported
            against the highest and latest aim within that year. For example, if a learner
            achieves an aim at Level 2, and a separate Full Level 3 aim in the same
            academic year at the same provider, their destinations will be reported against
            the Full Level 3 aim. Full Level 2 and Full Level 3 are counted as higher than
            other Level 2 and Level 3 aims respectively, and apprenticeship aims are
            prioritised over education and training aims."),
          h3("What data is used?"),
          tagList(
            p("The Longitudinal Education Outcomes (LEO) dataset is used, which looks at how
    learners move through education and into the labour market by bringing together:"),
            tags$ul(
              tags$li("Schools, further and higher education information from the Department for Education (DfE)"),
              tags$li("Employment information from HM Revenue and Customs (HMRC)"),
              tags$li("Benefit histories from the Department of Work and Pensions (DWP)")
            ),
            p("All learner counts reported here relate to those learners for whom a match was found in the LEO data,
    therefore the counts will not match headline achievements in the FE & Skills National Statistics release.")
          ),
          h3("What further data is available?"),
          p("In addition to the headline measures presented in this publication, further
            data is available on detailed destination, earnings and progression measures
            broken down by geographic areas, provider, learner demographics, type/level
            of learning completed and qualification title."),
          p("A number of detailed breakdowns using this data have been signposted
          throughout the publication, and can also be accessed using the table builder
          tool which allows users to build custom tables. Alternatively, the underlying
          data files themselves can be downloaded from the ‘Data catalogue' section above."),
          p("The outcomes reported in the commentary are presented as raw figures.
            They do not seek to control for differences in learner characteristics
            that may influence outcomes over time or across different learner populations."),
          h3("Rounding and suppression"),
          p("Full details on rounding and suppression are available in the accompanying methodology document."),
          p("Any percentage point (ppt) changes reported that appear to mismatch the percentages provided
            in the charts and tables are due to rounding conventions. The use of rounding and
            suppression may also mean that some charts do not appear to add up to 100%.")
        )
      )
    )
  )
}
