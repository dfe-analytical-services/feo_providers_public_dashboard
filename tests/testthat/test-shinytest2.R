library(shinytest2)

test_that("{shinytest2} recording: feo_providers_public_dashboard", {
  app <- AppDriver$new(
    test_path("../.."),
    name = "feo_providers_public_dashboard",
    height = 868,
    width = 1203,
    load_timeout = 360000
  )

  app$set_inputs(cookies = character(0), allow_no_input_binding_ = TRUE)
  app$click("cookies_banner-cookies_reject")
  app$set_inputs(cookies = "denied", allow_no_input_binding_ = TRUE)

  app$set_inputs(selectUKPRN = "BEDFORD COLLEGE")
  app$expect_values()

  app$set_inputs(selectUKPRN = "AYLESBURY COLLEGE")
  app$expect_values()

  app$set_inputs(
    tabsetpanels = "Benefit Status",
    selectProvision01 = "Education & Training"
  )
  app$expect_values()

  app$set_inputs(tabsetpanels = "Community Learning")
  app$expect_values()

  app$set_inputs(navlistPanel = "User guide")
  app$expect_values()
})



