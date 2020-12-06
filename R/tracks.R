#' Get audio features for multiple tracks based on their Spotify IDs.
#'
#' @param track.ids a string vector of the Spotify track IDs
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of audio features of the multiple tracks
#' @export
#'
#' @examples
get_multiple_audio_features <- function(track.ids = c(), limit =100, offset = 0){
  base_url <-'https://api.spotify.com/v1/audio-features/?ids='
  ids <- gsub(" ", "", toString(track.ids))
  url <- paste0(base_url, ids)
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}

#' Get audio feature information for a single track identified by its unique Spotify ID.
#'
#' @param track.id a string of one Spotify track's ID
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return audio features of fpr a single track
#' @export
#'
#' @examples
get_one_audio_features <- function(track.id = "", limit =100, offset = 0){
  url <- paste0('https://api.spotify.com/v1/audio-features/', track.id)
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}

#' Get Spotify catalog information for multiple tracks based on their Spotify IDs.
#'
#' @param track.ids a string vector of the Spotify track IDs
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of Spotify catalog information for multiple tracks
#' @export
#'
#' @examples
get_multiple_tracks_info <- function(track.ids, limit =50, offset = 0){
  base_url <-'https://api.spotify.com/v1/tracks/?ids='
  ids <- gsub(" ", "", toString(track.ids))
  url <- paste0(base_url, ids)
  res <- GET(url, list(limit=limit, offset=offset))$track
  return(res)
}

#' Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'
#' @param track.id a string of one Spotify track's ID
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return Spotify catalog informatuon for a single track
#' @export
#'
#' @examples
get_one_tracks_info <- function(track.id, limit =50, offset = 0){
  url <- paste0('https://api.spotify.com/v1/tracks/', track.id)
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}

#' Get a detailed audio analysis for a single track identified by its unique
#' Spotify ID.
#'
#' @param track.id a string of one Spotify track's ID
#'
#' @return a detailed audio analysis for a single track. See details
#'   \href{https://developer.spotify.com/documentation/web-api/reference/tracks/get-audio-analysis/}{Spotify
#'    Web API}
#' @export
#'
#' @examples
get_one_audio_analysis <- function(track.id){
  url <- paste0('https://api.spotify.com/v1/audio-analysis/', track.id)
  res <- xGET(url)
  return(res)
}
