#devtools::load_all("~/Dropbox/github/pol345.student")
context("get_problemset")

test_that("in a fresh directory", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("handout3")) # clean start
    unlink("handout3", recursive = TRUE)

  get_handout(3)
  expect_true(any(grepl("handout3", list.dirs()))) # folder unpacks
  rmd <- file.path(tmp, "handout3", "handout3.Rmd")
  expect_true(file.exists(rmd)) # with contents

  unlink("handout3", recursive = TRUE) # remove
})

test_that("in a fresh directory, setting the newname", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("handout3")) # clean start
    unlink("handout3", recursive = TRUE)

  get_handout(3, newname = "gmm")
  expect_true(file.exists("gmm")) # we moved
  expect_true("handout3.Rmd" %in% list.files("gmm")) # we're next to the rmd

  setwd(tmp)
  unlink("gmm", recursive = TRUE) # remove
})

test_that("in a directory with a handout already unpacked", {
  tmp <- tempdir()
  setwd(tmp)
  if (dir.exists("handout3")) # clean start
    unlink("handout3", recursive = TRUE)

  get_handout(3)
  expect_error(get_handout(3), "exists here already")
})

