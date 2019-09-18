
is_lei_unix_ts <- function(ts){
	#' Check if a string is a unix millisecond timestamp
	#'
	assertthat::assert_that(all(is.character(ts) | is.na(ts)))

	# rx_start_of_line() %>%
	# 	rx_multiple(rx_digit(), min = 11, max = 13) %>%
	# 	rx_end_of_line()

	ifelse(is.na(ts),
				 FALSE,
				 grepl("^([\\d]){11,13}$", ts, perl = TRUE))

}


parse_lei_unix_ts <- function(ts){
	#' Parse LEI Unix Timestamps
	#'
	#' LEI data has some timestamps in Unix millisecond timestamps. This functions parses them into POSIXct.
	#' @param ts Unix millisecond timestamps
	#' @return POSIXct timestamps
	#'

	assertthat::assert_that(all(is.character(ts) | is.na(ts)))


	nm_ts <- suppressWarnings(as.numeric(ts))
	as.POSIXct(ifelse(is_lei_unix_ts(ts),
										nm_ts / 1000,
										NA),
						 origin="1970-01-01 00:00:00")

}

is_lei_iso8601_ts <- function(ts){
	#' Check if a string is an ISO8601 time stamp
	#'
	assertthat::assert_that(all(is.character(ts) | is.na(ts)))

	# rx_start_of_line() %>%
	# 	rx_multiple(rx_digit(), min = 4, max = 4) %>%
	# 	rx_find("-") %>%
	# 	rx_multiple(rx_digit(), min = 2, max = 2) %>%
	# 	rx_find("-") %>%
	# 	rx_multiple(rx_digit(), min = 2, max = 2) %>%
	# 	rx_find("T") %>%
	# 	rx_anything()

	ifelse(is.na(ts),
				 FALSE,
				 grepl("^(\\d){4}(-)(\\d){2}(-)(\\d){2}(T)(.*)", ts, perl = TRUE))
}


parse_lei_iso8601_ts <- function(ts){
	#' Parse LEI ISO8601 Timestamps
	#'

	assertthat::assert_that(all(is.character(ts) | is.na(ts)))

	lubridate::parse_date_time(ts, orders = c("ymdT*","ymdT*z!*"), quiet = TRUE)
}

parse_lei_ts <- function(ts){

	dplyr::case_when(is_lei_unix_ts(ts) ~ parse_lei_unix_ts(ts),
									 is_lei_iso8601_ts(ts) ~ parse_lei_iso8601_ts(ts),
									 TRUE ~ as.POSIXct(NA))
}


