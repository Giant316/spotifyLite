#' Creates an access token to access Spotify web API.
#'
#' @description Creates a long-lived access token that allows R to make calls to
#'   the Spotify API.
#' @param client_id System Environment variable "SPOTIFY_CLIENT_ID"
#' @param client_secret System Environment variable "SPOTIFY_CLIENT_SECRET"
#' @param scope Space delimited string of spotify scopes. All scopes are
#'   selected by default
#'
#' @export
#'
#' @examples
get_access_token <- function(client_id = Sys.getenv("SPOTIFY_CLIENT_ID"),
                             client_secret = Sys.getenv("SPOTIFY_CLIENT_SECRET"),
                             scope = spotifyr::scopes)
{
  endpoint <- httr::oauth_endpoint(authorize = "https://accounts.spotify.com/authorize",
                             access = "https://accounts.spotify.com/api/token")
  app <- httr::oauth_app("spotifyrLite", client_id, client_secret)
  return(httr::oauth2.0_token(endpoint = endpoint, app = app, scope = scope))
}

#' GET request data from Spotify with limit and offset parameters
#'
#' @param url a Spotify URL request
#' @param params a list that contains limit and offset values
#' @param oAuth A valid access token from the Spotify Accounts service.
#'
#' @return
#' @export
#'
#' @examples
GET <- function(url, params, oAuth = get_access_token()){
  req <- httr::RETRY('GET', url, query = params,
              httr::config(token = oAuth), encode = 'json')
  req <- jsonlite::fromJSON(httr::content(req, as = 'text', encoding = 'UTF-8'),
                     flatten = TRUE)
  return(req)
}

#' GET request data from Spotify without limit and offset parameters
#'
#' @param url a Spotify URL request
#' @param oAuth A valid access token from the Spotify Accounts service.
#'
#' @return
#' @export
#'
#' @examples
xGET <- function(url, oAuth = get_access_token()){
  req <- httr::RETRY('GET', url, httr::config(token = oAuth), encode = 'json')
  req <- jsonlite::fromJSON(httr::content(req, as = 'text', encoding = 'UTF-8'),
                            flatten = TRUE)
  return(req)
}
