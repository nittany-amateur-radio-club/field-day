library(kableExtra)

cs_dt <- mtcars[1:10, 1:2]
cs_dt$car = row.names(cs_dt)
row.names(cs_dt) <- NULL
cs_dt$mpg = cell_spec(cs_dt$mpg, color = ifelse(cs_dt$mpg > 20, "red", "blue"))
cs_dt$cyl = cell_spec(
  cs_dt$cyl, color = "white", align = "c", angle = 45, 
  background = factor(cs_dt$cyl, c(4, 6, 8), c("#666666", "#999999", "#BBBBBB")))
cs_dt <- cs_dt[c("car", "mpg", "cyl")]

kbl(cs_dt, escape = F) %>%
  kable_paper("striped", full_width = F)


survey_resps$attend_sat <- kableExtra::cell_spec(survey_resps$attend_sat,
                                                 color = ifelse(survey_resps$attend_sat == TRUE, "green", "red"))

survey_resps$attend_sun <- kableExtra::cell_spec(survey_resps$attend_sun,
                                                 color = ifelse(survey_resps$attend_sun == TRUE, "green", "red"))

# survey_resps$overnight <- kableExtra::cell_spec(survey_resps$overnight,
# color = ifelse(survey_resps$overnight == "yes", "green", "red"))

survey_resps |>
  dplyr::select(callsign, attend_sat, attend_sun, overnight) |>
  kableExtra::kbl(escape = FALSE) |>
  kableExtra::kable_classic()
