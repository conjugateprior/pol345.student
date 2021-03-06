% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{get_handout}
\alias{get_handout}
\title{Unpack Handout Materials by Number}
\usage{
get_handout(pnum, newname = NULL)
}
\arguments{
\item{pnum}{Number of handout}

\item{newname}{Your preferred name for the unpacked handout materials.
(Default: NULL)}
}
\description{
This function finds a handout materials by its number,
unpacks it into your current working directory, and
provides some hints to get going.
}
\details{
By default the handout materials will unpack into a folder called, e.g.
'handout7' if 7 is the number you provided.

If you'd prefer to unpack the materials under a different name, perhaps
because you've decided to start fresh, or because for whatever reason there's
already a folder with that name where you want to unpack it, use the
\code{newname} argument to asign a new one.  (Note that this only renames the
top folder. The contents are keep their original names.)
}
\seealso{
\code{\link{preview_handout}} to see handout without
         unpacking anything.
}
