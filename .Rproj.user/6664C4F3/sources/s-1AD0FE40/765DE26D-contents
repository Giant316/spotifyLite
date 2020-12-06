#' Get a list of the playlists owned or followed by a Spotify user.
#'
#' @param user.id The Spotify user ID
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param  filter a boolean to return all data or filtered data
#'
#' @return a list of playlists
#' @export
#'
#' @examples
get_playlist_byUser <- function(user.id, limit = 50, offset = 0, filter=TRUE){
  url <- paste0('https://api.spotify.com/v1/users/', user.id, '/playlists')
  if(filter){
    res <- GET(url, list(limit=limit, offset=offset))$items
    res <- list(description = res$description, id = res$id, name = res$name,
                tracks.total = res$tracks.total)
  }
  else{
    res <- GET(url, list(limit=limit, offset=offset))
  }

  return(res)
}

#' Get a Playlist's tracks
#'
#' @description Get full details of the tracks or episodes of a playlist owned
#'   by a Spotify user
#' @param playlist.id The Spotify ID for the playlist
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param  filter a boolean to return all data or filtered data
#'
#' @return details of tracks of a playlist
#' @export
#'
#' @examples
get_track_byPlaylist <- function(playlist.id, limit = 50, offset = 0, filter = TRUE){
  url <- paste0("https://api.spotify.com/v1/playlists/",playlist.id, "/tracks")
  if(filter){
    res <- GET(url, list(limit=limit, offset = offset))$items
    res <- list(track.id = res$track.id, track.name = res$track.name,
                track.artists = res$track.artists, track.type = res$track.type,
                track.popularity = res$track.popularity, track.album.id = res$track.album.id,
                track.album.name = res$rack.album.name, track.album.type = res$track.album.type,
                track.album.release_date = res$track.album.release_date)
  }
  else{
    res <- GET(url, list(limit=limit, offset = offset))
  }
  return(res)
}

#' Get a playlist information
#'
#' @param playlist.id The Spotify ID for the playlist
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#' @param  filter a boolean to return all data or filtered data
#'
#' @return a list of information regarding to a playlist
#' @export
#'
#' @examples
get_one_playlist_info <- function(playlist.id, limit = 50, offset = 0, filter = TRUE){
  url <- paste0("https://api.spotify.com/v1/playlists/", playlist.id)
  if(filter){
    res <- GET(url, list(limit=limit, offset = offset))$tracks$items
  }
  else{
    res <- GET(url, list(limit=limit, offset = offset))
  }
}
