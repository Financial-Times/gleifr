% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-lei-csv.R
\name{read_gleif_relationships_csv}
\alias{read_gleif_relationships_csv}
\title{Read GLEIF relationships csv file}
\usage{
read_gleif_relationships_csv(file)
}
\arguments{
\item{file}{Path to a csv file}
}
\description{
Read the "Level 1 LEI-CDF Golden Copy File" downloaded from
\url{https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/}.
This function will read the useful columns, clean the names and convert
timestamps into dates.
}
