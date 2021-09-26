#' The pol345.student Package
#'
#' This package contains handouts for
#' Marc Ratkovic and Will Lowe's version of POL 345.
#'
#' @section Unpacking Handout Materials:
#'
#' Use \code{\link{get_handout}}, with a number to unpack handout materials
#' in a local directory.  For example:
#'
#' \code{get_handout(2)}
#'
#' This will unpack the second handout materials into a folder called
#' 'handout2` in your current working directory.
#' (Type \code{\link{getwd}} if you're
#' not sure where that is.  You can change it using \code{\link{setwd}} or
#' through the graphical user interface).
#'
#' @section Starting Again:
#' If you want to start again on the same handout, you'll can unpack the
#' handout materials again under a different name (\code{\link{get_handout}} won't
#' overwrite an existing folder.)  To do this use the
#' \code{newname} argument.  If you want your new copy to be called
#' 'handout2-forreal', then use
#'
#' \code{get_handout(2, newname = "handout2-forreal")}
#'
#' Provided there's not already a folder of that name in your
#' current working directory, you'll get a fresh set of handout materials
#' unpacked there.
#'
#' If you want to preview the questions in a handout materials without
#' unpacking it into your local file system, use \code{\link{preview_handout}}.
#'
#' @docType package
#' @name pol345.student
NULL

get_handout_by_number <- function(num){
  system.file(file.path("extdata", paste0("handout", num, ".zip")),
              package = "pol345.student")
}

get_precept_by_number <- function(num){
  system.file(file.path("extdata", paste0("precept", num, ".zip")),
              package = "pol345.student")
}

get_problemset_by_number <- function(num){
  system.file(file.path("extdata", paste0("problemset", num, ".zip")),
              package = "pol345.student")
}

#' Unpack Handout Materials by Number
#'
#' This function finds a handout materials by its number,
#' unpacks it into your current working directory, and
#' provides some hints to get going.
#'
#' By default the handout materials will unpack into a folder called, e.g.
#' 'handout7' if 7 is the number you provided.
#'
#' If you'd prefer to unpack the materials under a different name, perhaps
#' because you've decided to start fresh, or because for whatever reason there's
#' already a folder with that name where you want to unpack it, use the
#' \code{newname} argument to asign a new one.  (Note that this only renames the
#' top folder. The contents are keep their original names.)
#'
#' @param pnum Number of handout
#' @param newname Your preferred name for the unpacked handout materials.
#'                (Default: NULL)
#' @seealso \code{\link{preview_handout}} to see handout without
#'          unpacking anything.
#' @export
get_handout <- function(pnum, newname = NULL){
  f <- get_handout_by_number(pnum)
  if (f == "")
    stop("There is no handout numbered '", pnum, "'")
  pname <- paste0("handout", pnum)

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


  cli::cat_line("Hint: To start working on this handout", col = "darkgray")
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

#' Unpack Precept Materials by Number
#'
#' This function finds a precept materials by its number,
#' unpacks it into your current working directory, and
#' provides some hints to get going.
#'
#' By default the precept materials will unpack into a folder called, e.g.
#' 'precept6' if 6 is the number you provided.
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
#' @param pnum precept number
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
    message("Sorry. There doesn't seem to be a preview available for that precept")
}

#' Preview Handout Materials
#'
#' Launches the pdf viewer to show the questions in some handout materials.
#'
#' @param pnum handout number
#'
#' @return Nothing.
#' @export
#'
preview_handout <- function(pnum){
  f <- get_handout_by_number(pnum)
  if (f == "")
    stop("There is no handout numbered '", pnum, "'")
  pname <- paste0("handout", pnum)

  tmp <- tempdir()
  utils::unzip(f, exdir = tmp)
  pdf <- file.path(tmp, pname, paste0(pname, "_print.pdf"))
  if (file.exists(pdf))
    utils::browseURL(pdf)
  else
    message("Sorry. There doesn't seem to be a preview available for that handout")
}

#' Show Precept Answers
#'
#' Launches the pdf viewer to show the questions and answers
#' in a precept.
#'
#' @param pnum precept number
#'
#' @return Nothing.
#' @export
#'
get_precept_answers <- function(pnum){
  pdf <- system.file(file.path("extdata", paste0("precept", pnum, "-inst.pdf")),
              package = "pol345.student")
  if (pdf == "")
    stop("Cannot locate the precept answers for precept ", pnum)
  utils::browseURL(pdf)
}



#' Rename File to Add Your netid
#'
#' This function takes the name of your compiled handout or precept
#' document and prepends your netid. So if your netid was \code{lee89}
#' and you had just made \code{handout3.pdf}, then
#' \code{rename_for_upload("handout3.pdf")} would create a file called
#' \code{lee89_handout3.pdf} which you could upload the Blackboard.
#'
#'
#'
#' Note: This function assumes that your username is also your netid.
#' If this isn't true, don't use this function! Just rename the file
#' by hand.
#'
#' @param fname A pdf file you want to upload to Blackboard
#'
#' @return Returns nothing, but does change the name of the file
#' @export
#'
rename_for_upload <- function(fname){
  if (file.exists(fname)){
    newname <- paste0(Sys.getenv("USER"), "_", fname)
    success <- file.rename(fname, newname)
    if (!success)
      stop("Boo. It looks like the operating system won't let you do this. Better do it manually.")
  } else {
    mess <- paste0("Is there really a file called ",
                   fname, " in your current working directory (",
                   getwd(), ")?")
    stop(mess)
  }
}

#' Update the package
#'
#' This function updates the package by running
#' \code{devtools::install_github("ratkovic/pol345.student")}.
#'
#' @return Nothing
#' @export
#'
update_package <- function(){
  #devtools::install_github("conjugateprior/pol345.student")
  devtools::install_github("ratkovic/pol345.student")
  
}


#' Unpack Problem Set by Number
#'
#' This function finds a problem set number,
#' unpacks it into your current working directory, and
#' provides some hints to get going.
#'
#' By default the handout materials will unpack into a folder called, e.g.
#' 'problemset1' if 1 is the number you provided.
#'
#' If you'd prefer to unpack the materials under a different name, perhaps
#' because you've decided to start fresh, or because for whatever reason there's
#' already a folder with that name where you want to unpack it, use the
#' \code{newname} argument to asign a new one.  (Note that this only renames the
#' top folder. The contents are keep their original names.)
#'
#' @param pnum Number of problem set
#' @param newname Your preferred name for the unpacked problem set materials.
#'                (Default: NULL)
#' @export
get_problemset <- function(pnum, newname = NULL){
  f <- get_problemset_by_number(pnum)
  if (f == "")
    stop("There is no problem set numbered '", pnum, "'")
  pname <- paste0("problemset", pnum)
  
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
  
  
  cli::cat_line("Hint: To start working on this problem set", col = "darkgray")
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
    cli::cat_line("It's also a good idea to update the files pane ",
                  "to show your current working directory. ",
                  "To do that, click on the grey right-turned arrow ",
                  "in this header of this Console", col = "darkgrey")
  }
}

