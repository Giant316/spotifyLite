#' Get Spotify Catalog information about playlist
#'
#' @param search_word search query keyword
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param include_external include_external=audio is specified the response will
#'   include any relevant audio content that is hosted externally.
#'
#' @return a list of Spotify Catalog information about playlist
#' @export
#'
#' @examples
search_playlist_byName <- function(search_word, limit = 50, offset = 0,
                            include_external = audio){
  query <- gsub(" ", "+", search_word)
  url <- paste0('https://api.spotify.com/v1/search?query=', query,
                '&offset=', as.character(offset),'&limit=', as.character(limit),
                '&type=playlist')
  res <- GET(url, list(limit=limit, offset=offset))$playlists$items
  res <- list(description = res$description, href = res$href,
              id = res$id, name = res$name)
  return(res)
}

#' Get Spotify Catalog information about tracks
#'
#' @param search_word search query keyword
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param include_external include_external=audio is specified the response will
#'   include any relevant audio content that is hosted externally.
#'
#' @return a list of Spotify Catalog information about tracks
#' @export
#'
#' @examples
search_track_byName <- function(search_word, limit = 50, offset = 0,
                                include_external = audio){
  query <- gsub(" ", "+", search_word)
  url <- paste0('https://api.spotify.com/v1/search?query=', query,
                '&offset=', as.character(offset),'&limit=', as.character(limit),
                '&type=track')
  res <- GET(url, list(limit=limit, offset=offset))$tracks$items
  res$disc_number <- res$explicit <- res$is_local <- res$uri <- NULL
  res$album.images <- res$album.release_date_precision <- NULL
  res$album.type <- res$album.uri <- res$external_urls.spotify <- NULL
  res$album.external_urls.spotify <- res$external_ids.isrc <- NULL
  return(res)
}

#' Get Spotify Catalog information about artists
#'
#' @param search_word search query keyword
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param include_external include_external=audio is specified the response will
#'   include any relevant audio content that is hosted externally.
#'
#' @return a list of Spotify Catalog information about artists
#' @export
#'
#' @examples
search_artist_byName <- function(search_word, limit = 50, offset = 0,
                                include_external = audio){
  query <- gsub(" ", "+", search_word)
  url <- paste0('https://api.spotify.com/v1/search?query=', query,
                '&offset=', as.character(offset),'&limit=', as.character(limit),
                '&type=artist')
  res <- GET(url, list(limit=limit, offset=offset))$artists$items
  res$images <- res$type <- res$uri <- res$external_urls.spotify <- NULL
  res$followers.href <- NULL
  return(res)
}

#' Get Spotify Catalog information about albums
#'
#' @param search_word search query keyword
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param include_external include_external=audio is specified the response will
#'   include any relevant audio content that is hosted externally.
#'
#' @return a list of Spotify Catalog information about albums
#' @export
#'
#' @examples
search_album_byName <- function(search_word, limit = 50, offset = 0,
                                 include_external = audio){
  query <- gsub(" ", "+", search_word)
  url <- paste0('https://api.spotify.com/v1/search?query=', query,
                '&offset=', as.character(offset),'&limit=', as.character(limit),
                '&type=album')
  res <- GET(url, list(limit=limit, offset=offset))$albums$items
  res$images <- res$type <- res$uri <- res$external_urls.spotify <- NULL
  res$release_date_precision <- NULL
  return(res)
}

#' Get Spotify Catalog information about albums, artists, playlists, tracks,
#' shows or episodes that match a keyword string.
#'
#' @param search_word search query keyword
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param include_external include_external=audio is specified the response will
#'   include any relevant audio content that is hosted externally.
#'
#' @return a list of Spotify Catalog information that match the keyword string
#' @export
#'
#' @examples
search_byQuery <- function(query, limit = 50, offset = 0, include_external = audio){
  #name:abacab&type=album,track
  url <- paste0('https://api.spotify.com/v1/search?query=', query,
                '&offset=', as.character(offset),'&limit=', as.character(limit))
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}


