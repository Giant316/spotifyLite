#' Get public profile information about a Spotify user.
#'
#' @param user.id The Spotify user ID
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of public profile information about a Spotify user. See details
#'   \href{https://developer.spotify.com/documentation/web-api/reference/users-profile/get-users-profile/}{Spotify Web API}
#'
#' @export
#'
#' @examples
get_user_info <- function(user.id = "", limit = 50, offset = 0){
  url <- paste0('https://api.spotify.com/v1/users/', user.id)
  res <- GET(url, list(limit=limit, offset=offset))
  return(res)
}
