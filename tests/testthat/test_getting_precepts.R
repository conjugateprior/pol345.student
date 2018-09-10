context("get_precept")

test_that("in a fresh directory", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept3")) # clean start
    unlink("precept3", recursive = TRUE)

  get_precept(3)
  expect_true(any(grepl("precept3", list.dirs()))) # folder unpacks
  rmd <- file.path(tmp, "precept3", "precept3.Rmd")
  expect_true(file.exists(rmd)) # with contents

  unlink("precept3", recursive = TRUE) # remove
})

test_that("in a fresh directory, setting the newname", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept3")) # clean start
    unlink("precept3", recursive = TRUE)

  get_precept(3, newname = "gmm")
  expect_true(file.exists("gmm")) # we moved
  expect_true("precept3.Rmd" %in% list.files("gmm")) # we're next to the rmd

  setwd(tmp)
  unlink("gmm", recursive = TRUE) # remove
})

test_that("in a directory with a precept already unpacked", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("precept3")) # clean start
    unlink("precept3", recursive = TRUE)

  get_precept(3)
  expect_error(get_precept(3), "exists here already")
})
