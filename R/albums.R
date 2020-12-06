#' Get Spotify catalog information about an album’s tracks.
#'
#' @param album.id The Spotify ID for the album.
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of Spotify catalog information an album’s tracks.
#' @export
#'
#' @examples
get_album_tracks <- function(album.id, limit = 50, offset = 0){
  url <- paste0('https://api.spotify.com/v1/albums/', album.id, '/tracks')
  res <- GET(url, list(limit=limit, offset=offset))$items
  return(res)
}
