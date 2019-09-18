
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gliefr

<!-- badges: start -->

<!-- badges: end -->

The goal of gliefr is to …

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("oliverelliott-ft/gleifr")
```

## Example

Download the latest LEI-CDF and RR-CDF files from gleif.org
<https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/>

``` r
library(gliefr)

# Read in the files
entities <- read_gleif_entities_csv(file = "path/to/lei-cdf.csv")
relationships <- read_gleif_relationships_csv(file = "path/to/rr-cdf.csv")
```

Find the ultimate owner of legal entities with

``` r

ultimate_owners <- ultimate_parent(entities, relationships)
```

Find full documenation of the cleaned data set with

``` r
?gleif_entities
?gleif_relationships
```

or the raw data documentation for
[entities](https://www.gleif.org/en/about-lei/common-data-file-format/lei-cdf-format)
and
[relationships](https://www.gleif.org/en/about-lei/common-data-file-format/relationship-record-cdf-format).

## Data Notes

1.  Having an LEI became a requirement for EU companies on 3rd Jan 2018.
    Unfortunately this means that there are very few entity and
    relationship registrations before that date.
2.  Entities relationships can be “IS\_DIRECTLY\_CONSOLIDATED\_BY”,
    “IS\_INTERNATIONAL\_BRANCH\_OF” (rare) or
    “IS\_ULTIMATELY\_CONSOLIDATED\_BY”. It is quite common for two
    entities to be both directly consolidated by and ultimately
    consolidated by.
