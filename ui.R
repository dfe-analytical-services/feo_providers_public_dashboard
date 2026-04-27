# -----------------------------------------------------------------------------
# This is the ui file. Use it to call elements created in your server file into
# the app, and define where they are placed, and define any user inputs.
#
# Other elements like charts, navigation bars etc. are completely up to you to
# decide what goes in. However, every element should meet accessibility
# requirements and user needs.
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# The documentation for GOV.UK components can be found at:
#
#    https://github.com/moj-analytical-services/shinyGovstyle
#
# -----------------------------------------------------------------------------

ui <- function(input, output, session) {
  bslib::page_fluid(
    # Set application metadata ------------------------------------------------
    tags$head(HTML(paste0("<title>", site_title, "</title>"))),
    tags$head(tags$link(rel = "shortcut icon", href = "dfefavicon.png")),
    use_shiny_title(),
    tags$html(lang = "en"),
    # Add meta description for search engines
    meta() %>%
      meta_general(
        application_name = site_title,
        description = "Department for Education (DfE) Further Education Outcomes provider data",
        robots = "index,follow",
        generator = "R-Shiny",
        subject = "stats development",
        rating = "General",
        referrer = "no-referrer"
      ),

    # Custom disconnect function ----------------------------------------------
    # Variables used here are set in the global.R file
    dfeshiny::custom_disconnect_message(
      links = sites_list,
      publication_name = parent_pub_name,
      publication_link = parent_publication
    ),

    # Load javascript dependencies --------------------------------------------
    # useShinydashboard(),
    shinyjs::useShinyjs(),

    # Cookies -----------------------------------------------------------------
    # Setting up cookie consent based on a cookie recording the consent:
    dfeshiny::dfe_cookies_script(),
    dfeshiny::cookies_banner_ui(
      name = "Further education outcomes provider tool"
    ),

    # Skip_to_main -------------------------------------------------------------
    # Add a 'Skip to main content' link for keyboard users to bypass navigation.
    # It stays hidden unless focussed via tabbing.
    shinyGovstyle::skip_to_main(),

    # Google analytics --------------------------------------------------------
    tags$head(includeHTML(("google-analytics.html"))),
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "govuk-select.css"
      )
    ),
    shinyGovstyle::full_width_overrides(),
    # Header ------------------------------------------------------------------
    dfeshiny::header(
      header = site_title
    ),

    # Beta banner -------------------------------------------------------------
    shinyGovstyle::banner(
      "beta banner",
      "beta",
      paste0(
        "This Dashboard is in beta phase and we are still reviewing performance
        and reliability."
      )
    ),
    gov_main_layout(
      bslib::navset_hidden(
        id = "pages",
        nav_panel(
          "dashboard",
          ## Main dashboard ---------------------------------------------------
          # Nav panels --------------------------------------------------------------
          shiny::navlistPanel(
            "",
            id = "navlistPanel",
            widths = c(2, 8),
            well = FALSE,
            # Content for these panels is defined in the R/ui_panels/ folder
            Headline_stats_panel(),
            user_guide_panel()
          )
        ),
        nav_panel(
          value = "accessibility_statement",
          "Accessibility",
          accessibility_panel()
        ),
        nav_panel(
          value = "cookies_statement",
          "Cookies",
          cookies_panel()
        ),
        nav_panel(
          value = "support",
          "Support and feedback",
          support_panel()
        )
      )
    ),

    # Footer ------------------------------------------------------------------
    footer(
      full = TRUE,
      links = c(
        "Accessibility statement",
        "Cookies statement",
        "Support"
      )
    )
  )
}
