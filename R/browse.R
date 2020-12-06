#' Get a List of Categories
#'
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a List of Categories available on Spotify
#' @export
#'
#' @examples
get_categories <- function(limit = 50, offset = 0){
  url <- 'https://api.spotify.com/v1/browse/categories'
  res <- GET(url, list(limit=limit, offset=offset))$categories$items
  res$icons <- NULL
  return(res)
}

#' Get a list of Spotify playlists tagged with a particular category.
#'
#' @param category.id The Spotify category ID for the category.
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of Spotify category's playlists
#' @export
#'
#' @examples
get_categories_playlists <- function(category.id, limit = 50, offset = 0){
  base_url <- 'https://api.spotify.com/v1/browse/categories'
  url <- paste0(base_url,"/",category.id, "/playlists")
  res <- GET(url, list(limit=limit, offset=offset))$playlists$items
  res <- list(description = res$description, href = res$href,
              id = res$id, name = res$name)
  return(res)
}

#' Get a list of new album releases featured in Spotify
#'
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of new album release
#' @export
#'
#' @examples
get_new_release <- function(limit = 50, offset = 0){
  url <- 'https://api.spotify.com/v1/browse/new-releases'
  res <- GET(url, list(limit=limit, offset=offset))$albums$items
  res$images <- res$release_date_precision <- res$type <- NULL
  res$uri <- res$external_urls.spotify <- NULL
  return(res)
}
