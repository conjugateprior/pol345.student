context("get_precept")

test_that("in a fresh directory", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept1")) # clean start
    unlink("precept1", recursive = TRUE)

  get_precept(1)
  expect_true(any(grepl("precept1", list.dirs()))) # folder unpacks
  rmd <- file.path(tmp, "precept1", "precept1.Rmd")
  expect_true(file.exists(rmd)) # with contents

  unlink("precept1", recursive = TRUE) # remove
})

test_that("in a fresh directory, setting the newname", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept1")) # clean start
    unlink("precept1", recursive = TRUE)

  get_precept(1, newname = "gmm")
  expect_true(file.exists("gmm")) # we moved
  expect_true("precept1.Rmd" %in% list.files("gmm")) # we're next to the rmd

  setwd(tmp)
  unlink("gmm", recursive = TRUE) # remove
})

test_that("in a directory with a precept already unpacked", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept1")) # clean start
    unlink("precept1", recursive = TRUE)

  get_precept(1)
  expect_error(get_precept(1), "exists here already")
})

