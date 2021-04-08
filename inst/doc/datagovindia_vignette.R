## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datagovindia)

## -----------------------------------------------------------------------------
###List of organizations (or ministries)
get_list_of_organizations() %>% 
  head


## -----------------------------------------------------------------------------
###List of sectors 
get_list_of_sectors() %>% 
  head

## ----results='hide'-----------------------------------------------------------
##Single Criteria
search_api_by_title(title_contains = "pollution") %>% head(2)


## ----echo=FALSE---------------------------------------------------------------
## Signle criteria
search_api_by_title(title_contains = "pollution") %>%
  head(2) %>% 
  knitr::kable()

## ----results='hide'-----------------------------------------------------------
##Multiple Criteria
dplyr::intersect(search_api_by_title(title_contains = "pollution"),
                 search_api_by_organization(organization_name_contains = "pollution"))


## ----echo=FALSE---------------------------------------------------------------
## Signle criteria
dplyr::intersect(search_api_by_title(title_contains = "pollution"),
                 search_api_by_organization(organization_name_contains = "pollution")) %>% 
  knitr::kable()

## ----results='hide'-----------------------------------------------------------
get_api_info(api_index = "0579cf1f-7e3b-4b15-b29a-87cf7b7c7a08")

## ----echo=FALSE---------------------------------------------------------------
get_api_info(api_index = "0579cf1f-7e3b-4b15-b29a-87cf7b7c7a08") %>% 
  knitr::kable()

## ----results='hide'-----------------------------------------------------------
get_api_fields(api_index = "0579cf1f-7e3b-4b15-b29a-87cf7b7c7a08")

## ----echo=FALSE---------------------------------------------------------------
get_api_fields(api_index = "0579cf1f-7e3b-4b15-b29a-87cf7b7c7a08") %>% 
  knitr::kable()

## -----------------------------------------------------------------------------
##Using a sample key
register_api_key("579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b")


## -----------------------------------------------------------------------------
register_api_key("579b464db66ec23bdd0000019fc84f43ca52437351b43702f5998234")

## ----results="hide"-----------------------------------------------------------
get_api_fields("3b01bcb8-0b14-4abf-b6f2-c1bfd384ba69")

## ----echo=FALSE---------------------------------------------------------------
get_api_fields("3b01bcb8-0b14-4abf-b6f2-c1bfd384ba69") %>% 
  knitr::kable()

## ----results='hide'-----------------------------------------------------------

get_api_data(api_index="3b01bcb8-0b14-4abf-b6f2-c1bfd384ba69",
             results_per_req=10,filter_by=c(city="Gurugram,Chandigarh",
                                            polutant_id="PM10,NO2"),
             field_select=c(),
             sort_by=c('state','city'))

## ----echo=FALSE,message=FALSE-------------------------------------------------

get_api_data(api_index="3b01bcb8-0b14-4abf-b6f2-c1bfd384ba69",
             results_per_req=10,filter_by=c(city="Gurugram,Chandigarh",                                 pollutant_id="PM10,NO2"),
             field_select=c(),
             sort_by=c('state','district','city')) %>% 
  knitr::kable()

