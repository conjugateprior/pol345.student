#' pol345
#'
#' This package contains precept materials for
#' Marc Ratkowic's version of POL 345.
#'
#' @section Unpacking Precept Materials:
#'
#' Use \code{\link{get_precept}}, with a number to unpzck precept materials
#' in a local directory.  For example:
#'
#' \code{get_precept(2)}
#'
#' This will unpack the second precept materials into a folder called
#' 'precept2` in your current working directory.
#' (Type \code{\link{getwd}} if you're
#' not sure where that is.  You can change it using \code{\link{setwd}} or
#' through the graphical user interface).
#'
#' @section Starting Again:
#' If you want to start again on the same precept, you'll can unpack the
#' precept materials again under a different name (\code{\link{get_precept}} won't
#' overwrite an existing folder.)  To do this use the
#' \code{newname} argument.  If you want your new copy to be called
#' 'precept2-forreal', then use
#'
#' \code{get_precept(2, newname = "precept2-forreal")}
#'
#' Provided there's not already a folder of that name in your
#' current working directory, you'll get a fresh set of precept materials
#' unpacked there.
#'
#' If you want to preview the questions in a precept materials without
#' unpacking it into your local file system, use \code{\link{preview_precept}}.
#'
#' @docType package
#' @name pol345
NULL

get_precept_by_number <- function(num){
  system.file(file.path("extdata", paste0("precept", num, ".zip")),
              package = "pol345")
}

#' Unpack Precept Materials by Number
#'
#' This function finds a precept materials by its number,
#' unpacks it into your current working directory, and
#' provides some hints to get going.
#'
#' By default the precept materials will unpack into a folder called, e.g.
#' 'precept7' if 7 is the number you provided.
#'
#' If you'd prefer to unpack the materials under a different name, perhaps
#' because you've decided to start fresh, or because for whatever reason there's
#' already a folder with that name where you want to unpack it, use the
#' \code{newname} argument to asign a new one.  (Note that this only renames the
#' top folder. The contents are keep their original names.)
#'
#' @param pnum Number of precept
#' @param newname Your preferred name for the unpacked precept materials.
#'                (Default: NULL)
#' @seealso \code{\link{preview_precept}} to see precept without
#'          unpacking anything.
#' @export
get_precept <- function(pnum, newname = NULL){
  f <- get_precept_by_number(pnum)
  if (f == "")
    stop("There is no precept numbered '", pnum, "'")
  pname <- paste0("precept", pnum)

  # f is the zip file
  temp <- ".unpacking_psets"
  if (!dir.exists(temp)) {
    success <- dir.create(temp)
    if (!success)
      stop("Could not create temporary directory", temp)
  }
  utils::unzip(f, exdir = temp)
  if (!is.null(newname)) { # they've assigned a new name
    if (!file.exists(newname)) {
      file.rename(file.path(temp, pname), newname)
      dname <- newname
    } else {
      unlink(temp, recursive = TRUE) # bye
      stop("A folder called ", newname, " exists here already.",
           " Choose a different value for newname or delete the ", newname,
           " folder and try again. Maybe also use getwd() to confirm you are where",
           " you think you are in the file system.")
    }
  } else {
    # they want it to use its original name
    if (!file.exists(pname)) {
      file.rename(file.path(temp, pname), pname)
      dname <- pname
    } else {
      unlink(temp, recursive = TRUE) # bye
      stop("A folder called ", pname, " exists here already.",
           " Choose a different value for newname or delete the ", pname,
           " folder and try again. Maybe also use getwd() to confirm you are where",
           " you think you are in the file system.")
    }
  }
  if (dir.exists(temp))
    unlink(temp, recursive = TRUE) # bye

  cli::cat_line("Hint: To start working on this precept", col = "darkgray")
  cli::cat_line("")
  cli::cat_bullet('setwd("', dname, '")',
                  col = "darkgray", bullet_col = "grey", bullet = "pointer")
  cli::cat_bullet('file.edit("', paste0(dname, '.Rmd'), '")',
                  bullet_col = "gray", col = "darkgray", bullet = "pointer")
  cli::cat_line("")

  cli::cat_line('To view the questions in compiled form, click on ',
                paste0(dname, '.pdf'), " in the Files tab",
                col = "darkgray")
  if (identical(.Platform$GUI, "RStudio")) {
    cli::cat_line("")
    cli::cat_line("It's also good idea to update the files pane ",
                  "to show your current working directory. ",
                  "To do that, click on the grey right-turned arrow ",
                  "in this header of this Console", col = "darkgrey")
  }
}

#' Preview Precept Materials
#'
#' Launches the pdf viewer to show the questions in some precept materials.
#'
#' @param pnum Precept number
#'
#' @return Nothing.
#' @export
#'
preview_precept <- function(pnum){
  f <- get_precept_by_number(pnum)
  if (f == "")
    stop("There is no precept numbered '", pnum, "'")
  pname <- paste0("precept", pnum)

  tmp <- tempdir()
  utils::unzip(f, exdir = tmp)
  pdf <- file.path(tmp, pname, paste0(pname, ".pdf"))
  if (file.exists(pdf))
    utils::browseURL(pdf)
  else
    message("Sorry. There doesn't seem to be a preview available for that pset")
}
