% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{rename_for_upload}
\alias{rename_for_upload}
\title{Rename File to Add Your netid}
\usage{
rename_for_upload(fname)
}
\arguments{
\item{fname}{A pdf file you want to upload to Blackboard}
}
\value{
Returns nothing, but does change the name of the file
}
\description{
This function takes the name of your compiled handout or precept
document and prepends your netid. So if your netid was \code{lee89}
and you had just made \code{handout3.pdf}, then
\code{rename_for_upload("handout3.pdf")} would create a file called
\code{lee89_handout3.pdf} which you could upload the Blackboard.
}
\details{
Note: This function assumes that your username is also your netid.
If this isn't true, don't use this function! Just rename the file
by hand.
}
