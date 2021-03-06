% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search.R
\name{search_byQuery}
\alias{search_byQuery}
\title{Get Spotify Catalog information about albums, artists, playlists, tracks,
shows or episodes that match a keyword string.}
\usage{
search_byQuery(query, limit = 50, offset = 0, include_external = audio)
}
\arguments{
\item{limit}{Maximum number of results to return}

\item{offset}{The index of the first result to return. Use with limit to get
the next page of search results.}

\item{include_external}{include_external=audio is specified the response will
include any relevant audio content that is hosted externally.}

\item{search_word}{search query keyword}
}
\value{
a list of Spotify Catalog information that match the keyword string
}
\description{
Get Spotify Catalog information about albums, artists, playlists, tracks,
shows or episodes that match a keyword string.
}
