#' Get Spotify catalog information about an artist’s top tracks by country.
#'
#' @param artist.id The Spotify ID for the artist.
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param country
#'
#' @return Spotify catalog information about an artist’s top tracks by country
#' @export
#'
#' @examples
get_artist_top_tracks <- function(artist.id, limit = 50, offset = 0, country = ""){
  url <- paste0('https://api.spotify.com/v1/artists/', artist.id,
                '/top-tracks?country=', country)
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}

#' Get Spotify catalog information about an artist’s albums.
#'
#' @param artist.id The Spotify ID for the artist.
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param country An ISO 3166-1 alpha-2 country code. See details
#'   \href{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}{ISO 3166-1 alpha-2}
#'
#' @return Spotify catalog information about an artist’s albums
#' @export
#'
#' @examples
get_artist_albums <- function(artist.id, limit = 50, offset = 0, country = ""){
  url <- paste0('https://api.spotify.com/v1/artists/', artist.id, '/albums')
  res <- GET(url, list(limit=limit, offset=offset))$items
  return(res)
}

#' Get Spotify catalog information about artists similar to a given artist.
#'
#' @param artist.id The Spotify ID for the artist.
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of Spotify catalog information about artists similar to a
#'   given artist.
#' @export
#'
#' @examples
get_related_artists <- function(artist.id, limit = 50, offset = 0){
  url <- paste0('https://api.spotify.com/v1/artists/', artist.id, '/related-artists')
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}
