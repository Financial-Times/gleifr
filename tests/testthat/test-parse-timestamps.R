context("test-parse-timestamps")

test_that("is_lei_unix_ts is TRUE for correct examples", {
  expect_true(is_lei_unix_ts("980985600000"))
	expect_true(is_lei_unix_ts("95040000000"))
	expect_true(is_lei_unix_ts("1514764800000"))
})

test_that("is_lei_unix_ts is FALSE for incorrect examples",{
	expect_false(is_lei_unix_ts("2018-01-01T00:00:00.000Z"))
	expect_false(is_lei_unix_ts("2018-01-01T00:00:00Z"))
})

test_that("is_lei_unix_ts vectorises",{
	expect_equal(is_lei_unix_ts(c("980985600000","980985600000","2018-01-01T00:00:00Z")),
									 c(TRUE,TRUE,FALSE))
})

test_that("is_lei_unix_ts handles NAs",{
	expect_false(is_lei_unix_ts(NA))
})

test_that("we can parse unix_timestamps",{
	expect_equal(parse_lei_unix_ts("980985600000"), as.Date("2001-02-01"))
	expect_equal(parse_lei_unix_ts("52534800000"), as.Date("1971-09-01"))
	expect_equal(parse_lei_unix_ts("1514764800000"), as.Date("2018-01-01"))
	expect_equal(parse_lei_unix_ts("1498089600000"), as.Date("2017-06-22"))
})

test_that("is_lei_iso8601_ts is TRUE for correct examples", {
	expect_true(is_lei_iso8601_ts("2017-10-31T00:00:00.000+01:00"))
	expect_true(is_lei_iso8601_ts("2016-09-01T00:00:00+02:00"))
	expect_true(is_lei_iso8601_ts("2017-01-01T00:00:00.000Z"))
})

test_that("is_lei_iso8601_ts is FALSE for incorrect examples", {
	expect_false(is_lei_iso8601_ts("980985600000"))
	expect_false(is_lei_iso8601_ts("1514764800000"))
})

test_that("is_lei_iso8601_ts handles NAs",{
	expect_false(is_lei_iso8601_ts(NA))
})

test_that("we can parse lei iso8601", {
	expect_equal(class(parse_lei_iso8601_ts("2017-10-31T00:00:00.000+01:00"))[1], "Date")
	expect_equal(class(parse_lei_iso8601_ts("2016-09-01T00:00:00+02:00"))[1], "Date")
	expect_equal(class(parse_lei_iso8601_ts("2017-01-01T00:00:00.000Z"))[1], "Date")
})

test_that("we can parse lei timestamp data",{
	expect_equal(parse_lei_ts(c("980985600000","2017-10-31T00:00:00",NA,"1514764800000")),
							 as.Date(c("2001-02-01","2017-10-31",NA,"2018-01-01")))
})

