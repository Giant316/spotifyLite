#' Retrieve Audio Features of all tracks in all the playlist of a Spotify user
#'
#' @param user.id The Spotify user ID
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of audio features, audio info of the tracks in all the playlist
#' @export
#'
#' @examples
get_audioFeatures_from_user <- function(user.id, limit = 50, offset = 0){
  `%>%` <- dplyr::`%>%`
  nxt_check <- get_playlist_byUser(user.id, limit, offset, filter=FALSE)$`next`
  cond = !is.null(nxt_check)
  playlist.ids <- get_playlist_byUser(user.id, limit, offset)$id
  playlist.names <- get_playlist_byUser(user.id, limit, offset)$name

  n <- 1
  while(cond){
    cat("Requesting more playlist...\n")
    more_ids <- get_playlist_byUser(user.id, limit = limit, offset = n*limit)$id
    playlist.ids <- append(playlist.ids, more_ids)
    cond <- !is.null(get_playlist_byUser(user.id, limit = limit, offset = n*limit, filter = FALSE)$`next`)
    n <- n + 1
  }
  return(get_audioFeatures_from_playlist(playlist.ids, limit = 50, offset = 0, playlist.names = playlist.names))
}

#' Retrieve Audio Features of all tracks of the playlist(s) provided
#'
#' @param playlist.id The Spotify ID for the playlist
#' @param limit Maximum number of results to return
#' @param offset The index of the first result to return. Use with limit to get
#'   the next page of search results.
#'
#' @return a list of audio features of all tracks corresponding to the playlist(s)
#' @export
#'
#' @examples
get_audioFeatures_from_playlist <- function(playlist.ids, limit = 50, offset = 0, playlist.names =""){
  `%>%` <- dplyr::`%>%`
  if(is.null(playlist.names)){
    playlist.names <- c()
    for(i in 1:length(playlist.ids)){
      playlist.names <- append(playlist.names, get_one_playlist_info(playlist.ids[i], filter = FALSE)$name)
    }
  }
  track.ids <- c()
  track.playlist <- c()
  cat("Pulling tracks from playlists...\n")
  for(i in 1:length(playlist.ids)){
    get_track.ids <- get_track_byPlaylist(playlist.ids[i])$track.id
    get_track.ids <- get_track.ids[!is.na(get_track.ids)]
    track.ids <- append(track.ids, get_track.ids)
    track.playlist <- append(track.playlist, rep(playlist.names[i], length(get_track.ids)))
  }
  cat("Pulling audio features and track info...\n")
  if(length(track.ids) < limit){
    res_feat <- get_multiple_audio_features(track.ids[1:length(track.ids)])$audio_features
    res_info <- get_multiple_tracks_info(track.ids[1:length(track.ids)])[c("artists","available_markets", "name", "popularity", "album.id", "album.name")]
  }
  else{
    res_feat <- get_multiple_audio_features(track.ids[1:limit])$audio_features
    res_info <- get_multiple_tracks_info(track.ids[1:limit])[c("artists","available_markets", "name", "popularity", "album.id", "album.name")]
  }
  n <- ceiling(length(track.ids)/limit)
  m <- seq(1, n*limit+1, limit)
  if(n != 1){
    for(j in 2:n){
      if(j != n){
        res_feat <- get_multiple_audio_features(track.ids[(m[j]):(j*limit)])$audio_features %>% rbind(res_feat)
        res_info <- get_multiple_tracks_info(track.ids[(m[j]):(j*limit)])[c("artists","available_markets", "name", "popularity", "album.id", "album.name")] %>% rbind(res_info)
      }
      else{
        res_feat <- get_multiple_audio_features(track.ids[(m[j]):length(track.ids)])$audio_features %>% rbind(res_feat)
        res_info <- get_multiple_tracks_info(track.ids[(m[j]):length(track.ids)])[c("artists","available_markets", "name", "popularity", "album.id", "album.name")] %>% rbind(res_info)
      }
    }
  }
  res <- cbind(res_info, res_feat, track.playlist)
  return(res)
}
