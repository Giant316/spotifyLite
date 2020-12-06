# SpotifyrLite: A lightweight R wrapper to access Spotify API

This package allows you to make requests to Spotify Web API to retrieve information such as audio features, audio analysis for a track, artist's top tracks, similar artists given a artist, etc. This is an experimental package that I’ve created to fulfill my needs in a project. It has not been tested extensively and coded in a manner that cater wide range of use cases, so please use it with caution. It is not intended to be uploaded to CRAN but you can download from GitHub using devtools: 

```R
library(devtools)
install_github(“Giant316/spotifyLite”)
```

## Authentication:

To access Spotify’s API, we need to have an authenticated token in order to make a request. We have to set up a developer account with Spotify (see [details](https://developer.spotify.com/documentation/general/guides/authorization-guide/)) to get the `Client ID` and `Client Secret`. I am using the easiest way to authenticate by setting the credentials to the system evironment variables, namely: `SPOTIFY_CLIENT_ID` and `SPOTIFY_CLIENT_SECRET`. The `get_access_token()` function in the package has the default arguments referring to those two variables. You can either set these two system environment variables manually or run the following lines in R: 

```R
client_id <- "YOUR CLIENT ID"
client_secret <- "YOUR CLIENT SECRET"
Sys.setenv(SPOTIFY_CLIENT_ID = client_id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = client_secret)
```

## How to use:

You can retrieve the audio features of all song tracks in your spotify account's playlist or any other user’s public playlist by providing the Spotify user’s id to the function `get_audioFeatures_from_user`: 

```R
> df <- get_audioFeatures_from_user("spotify")
Pulling tracks from playlists...
Pulling audio features and track info...
# All the data available:
> names(df)
 [1] "artists"           "available_markets" "name"              "popularity"       
 [5] "album.id"          "album.name"        "danceability"      "energy"           
 [9] "key"               "loudness"          "mode"              "speechiness"      
[13] "acousticness"      "instrumentalness"  "liveness"          "valence"          
[17] "tempo"             "type"              "id"                "uri"              
[21] "track_href"        "analysis_url"      "duration_ms"       "time_signature"   
[25] "track.playlist"
> nrow(df)
[1] 62499
```

The code above allow you to pull all audio features of tracks in the public playlist owned by “spotify” profile, at the time of writing, there are in total 62499 tracks owned by “spotify” profile that are in its public playlist. I output this object as `Spotify_publicPlaylist_AudioFeatures.txt`, if you want to load the file into R, run `dget(“filepath”)` 

If you know the Spotify’s playlist ID, you can also get the audio features information by runing `get_audioFeatures_from_playlist()`: 

```R
> df <- get_audioFeatures_from_playlist(c("6EXOulh2lBQBVNuyVeMv7L","37i9dQZF1DX4AyFl3yqHeK"))
Pulling tracks from playlists...
Pulling audio features and track info...
# All the data available:
> colnames(df)
 [1] "artists"           "available_markets" "name"              "popularity"       
 [5] "album.id"          "album.name"        "danceability"      "energy"           
 [9] "key"               "loudness"          "mode"              "speechiness"      
[13] "acousticness"      "instrumentalness"  "liveness"          "valence"          
[17] "tempo"             "type"              "id"                "uri"              
[21] "track_href"        "analysis_url"      "duration_ms"       "time_signature"   
[25] "track.playlist"  
> nrow(df)
[1] 87
```

You could search for the playlist id by its name: 

```R
> search_playlist_byName("Bossa", limit=3)
$description
[1] "Curta grandes sucessos da Bossa Nova, o gênero que mudou o Brasil para sempre."
[2] "Some of the world's biggest pop hits in bossa nova versions."                  
[3] "Soundtrack your dinner with bossa sounds."                                     

$href
[1] "https://api.spotify.com/v1/playlists/37i9dQZF1DX4AyFl3yqHeK"
[2] "https://api.spotify.com/v1/playlists/37i9dQZF1DXardnHdSkglX"
[3] "https://api.spotify.com/v1/playlists/37i9dQZF1DWVleyMkaelTd"

$id
[1] "37i9dQZF1DX4AyFl3yqHeK" "37i9dQZF1DXardnHdSkglX"
[3] "37i9dQZF1DWVleyMkaelTd"

$name
[1] "Bossa Nova"        "Bossa Nova Covers" "Bossa Nova Dinner"
```

You could also look for all the playlists owned by any user: 

```R
> spotify.playlist <- get_playlist_byUser("spotify")
> spotify.playlist$id
 [1] "37i9dQZF1DXcBWIGoYBM5M" "37i9dQZF1DX0XUsuxWHRQd" "37i9dQZF1DX1lVhptIYRda"
 [4] "37i9dQZF1DX10zKzsJ2jva" "37i9dQZF1DX4JAvHpjipBk" "37i9dQZF1DX4sWSpwq3LiO"
 [7] "37i9dQZF1DX4SBhb3fqCJd" "37i9dQZF1DWXRqgorJj26U" "37i9dQZF1DX4dyzvuaRJ0n"
[10] "37i9dQZF1DXcF6B6QPhFDv" "37i9dQZF1DWXJfnUiYjUKT" "37i9dQZF1DXcRXFNfZr7Tp"
[13] "37i9dQZF1DX4o1oenSJRJd" "37i9dQZF1DXbTxeAdrVG2l" "37i9dQZF1DX4UtSsGT1Sbe"
[16] "37i9dQZF1DWTJ7xPn4vNaz" "37i9dQZF1DXaKIA8E7WcJj" "37i9dQZF1DWSV3Tk4GO2fq"
[19] "37i9dQZF1DWTwnEm1IYyoj" "37i9dQZF1DX2A29LI7xHn1" "37i9dQZF1DX2RxBh64BHjQ"
[22] "37i9dQZF1DWVA1Gq4XHa6U" "37i9dQZF1DWY4xHQp97fN6" "37i9dQZF1DWX3387IZmjNa"
[25] "37i9dQZF1DWYkaDif7Ztbp" "37i9dQZF1DX5hR0J49CmXC" "37i9dQZF1DXan38dNVDdl4"
[28] "37i9dQZF1DWSvKsRPPnv5o" "37i9dQZF1DWUVpAXiEPK8P" "37i9dQZF1DX0Tkc6ltcBfU"
[31] "37i9dQZF1DX1YPTAhwehsC" "37i9dQZF1DWTggY0yqBxES" "37i9dQZF1DX0HRj9P7NxeE"
[34] "37i9dQZF1DWT6SJaitNDax" "37i9dQZF1DX2r0FByV5U4C" "37i9dQZF1DXaKctwWdt4be"
[37] "37i9dQZF1DWT2jS7NwYPVI" "37i9dQZF1DX82GYcclJ3Ug" "37i9dQZF1DX49jUV2NfGku"
[40] "37i9dQZF1DX1Jg9KZ76Rr9" "37i9dQZF1DX8FwnYE6PRvL" "37i9dQZF1DX6mvEU1S6INL"
[43] "37i9dQZF1DX2SK4ytI2KAZ" "37i9dQZF1DWZkHEX2YHpDV" "37i9dQZF1DWWJOmJ7nRx0C"
[46] "37i9dQZF1DXdXKIWnpyigm" "37i9dQZF1DX2rBR3X9E86S" "37i9dQZF1DWUlZhYdX0uqM"
[49] "37i9dQZF1DX82CY3GzF2m6" "37i9dQZF1DWWc7UGhP4Mpw"
```

Each request is limited to a return of at most 50 entries, by setting the offset, we can retrieve more data if it exists: 

```R
> spotify.playlist <- get_playlist_byUser("spotify", offset = 50)
> spotify.playlist$id
 [1] "37i9dQZF1DWVPJN9etkrEa" "37i9dQZF1DXbj9Ksq4BAdj" "37i9dQZF1DXcGV9sg8bMdx"
 [4] "37i9dQZF1DWXupFIUw7TOC" "37i9dQZF1DX5L9gRaHajqj" "37i9dQZF1DWY6vTWIdZ54A"
 [7] "37i9dQZF1DX5OUjSS1OMgV" "37i9dQZF1DX1rVvRgjX59F" "37i9dQZF1DX6ALfRKlHn1t"
[10] "37i9dQZF1DXa9xHlDa5fc6" "37i9dQZF1DX2aneNMeYHQ8" "37i9dQZF1DWXs1L3AC0Xio"
[13] "37i9dQZF1DXa6YOhGMjjgx" "37i9dQZF1DXcfZ6moR6J0G" "37i9dQZF1DWXMg4uP5o3dm"
[16] "37i9dQZF1DX2S9rTKTX6JP" "37i9dQZF1DX6ujZpAN0v9r" "37i9dQZF1DX0wiundViT27"
[19] "37i9dQZF1DX9Mqxt6NLTDY" "37i9dQZF1DX9wa6XirBPv8" "37i9dQZF1DXaGNG7NmtmZv"
[22] "37i9dQZF1DWZjmJmeiazwd" "37i9dQZF1DX8S0uQvJ4gaa" "37i9dQZF1DX5mB2C8gBeUM"
[25] "37i9dQZF1DWYnwbYQ5HnZU" "37i9dQZF1DX3Ee0ngF5ZVQ" "37i9dQZF1DWYiR2Uqcon0X"
[28] "37i9dQZF1DWW7RgkOJG32Y" "37i9dQZF1DX8WMG8VPSOJC" "37i9dQZF1DWXi7h4mmmkzD"
[31] "37i9dQZF1DWTkxQvqMy4WW" "37i9dQZF1DWU2LcZVHsTdv" "37i9dQZF1DWU1xHgjMaSpW"
[34] "37i9dQZF1DX1kw8OX1mNoI" "64FJj5HaUHR6KrKSsU8KPx" "37i9dQZF1DWVpjAJGB70vU"
[37] "37i9dQZF1DX24Kh15JFQJ0" "37i9dQZF1DXbDjX0hus3Iu" "37i9dQZF1DXc0fQ4sGOnVJ"
[40] "0NfjMqrzcGKVsbYZmhf4Md" "37i9dQZF1DWWH0izG4erma" "37i9dQZF1DWUzFXarNiofw"
[43] "37i9dQZF1DX4y8h9WqDPAE" "37i9dQZF1DWXnexX7CktaI" "37i9dQZF1DWSfMe9z89s9B"
[46] "37i9dQZF1DX2UgsUIg75Vg" "37i9dQZF1DX2Ma8k80RiMN" "37i9dQZF1DWY12BqhkMFW2"
[49] "37i9dQZF1DX62Nfha2yFhL" "37i9dQZF1DWVEvzGeX3eRs"
```

The tracks can also be searched by `search_track_byName`: 

```R
> tracks <- search_track_byName("space", limit=3)
> tracks$name
[1] "Space Cadet (feat. Gunna)"    "Space"                        "Space Oddity - 2015 Remaster"
> tracks$id
[1] "1fewSx2d5KIZ04wsooEBOz" "20wnO4hGXbWvIPDEmED8gM" "72Z17vmmeQKAg8bptWvpVG"
```

You could also write a query by yourself following the guidelines in [Spotify’s API Website](https://developer.spotify.com/documentation/web-api/reference/search/search/):

```R
> query <- search_byQuery("track:bad%20artist:eilish&type=track")
> query$tracks$items$album.name
[1] "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?" "bad guy (with Justin Bieber)"            
[3] "The Sound Of Summer 2020"                 "Bad Guy"                                 
[5] "Upbeat Acoustic Guitar Covers"           
> query$tracks$items$popularity
[1] 88 75 12 12 16
# All the data available:
> names(query$tracks$items)
 [1] "artists"                      "available_markets"           
 [3] "disc_number"                  "duration_ms"                 
 [5] "explicit"                     "href"                        
 [7] "id"                           "is_local"                    
 [9] "name"                         "popularity"                  
[11] "preview_url"                  "track_number"                
[13] "type"                         "uri"                         
[15] "album.album_type"             "album.artists"               
[17] "album.available_markets"      "album.href"                  
[19] "album.id"                     "album.images"                
[21] "album.name"                   "album.release_date"          
[23] "album.release_date_precision" "album.total_tracks"          
[25] "album.type"                   "album.uri"                   
[27] "album.external_urls.spotify"  "external_ids.isrc"           
[29] "external_urls.spotify"       
```

You could also search the playlists by some keywords: 

```R
> top50 <- search_playlist_byName("Top 50")
> top50$name
 [1] "Top 50 Deutschland"                                                                
 [2] "Top 50 der Welt"                                                                   
 [3] "Top-Songs weltweit"                                                                
 [4] "Top 50 Charts [Deutschland]"                                                       
 [5] "Top 50 Germany"                                                                    
 [6] "Top-Songs Deutschland"                                                             
 [7] "Top 50 Deutschland"                                                                
 [8] "TOP 50 RUSSIA"                                                                     
 [9] "TOP 50 EUROPE \U0001f30d"                                                          
[10] "Top 50 Türkei"                                                                     
[11] "TOP 50 US \U0001f30e"                                                              
[12] "TOP 50 GLOBAL HITS"                                                                
[13] "TOP 50 USA"                                                                        
[14] "Top 50 USA"                                                                        
[15] "Top 50 Turkey"                                                                     
[16] "Top 50 Spanien"                                                                    
[17] "Top 50 \U0001f1e7\U0001f1ea België | Hits Belgique | Dance Belgium | Party | Radio"
[18] "Top 50 Italien"                                                                    
[19] "Top 50 USA - Top 50 America - Top 50 US - Top 50 United States"                    
[20] "Top 50 Frankreich"                                                                 
[21] "Top 50 Russland"                                                                   
[22] "Top 50 Deutschland - Unterwegs Kitschkrieg Apache 207"                             
[23] "Top 50 - Italia"                                                                   
[24] "Top 50 Spain"                                                                      
[25] "Top 50 World"                                                                      
[26] "Top 50 Global"                                                                     
[27] "Top 50 UK"                                                                         
[28] "Top 50 Deutschrap"                                                                 
[29] "Deutschrap 2020: Top 50"                                                           
[30] "Top 50 der welt" 
```

You might also want to analyse Top 50 by country chart that owned by “sportifychart”, unfortunately I couldn’t find a clean way to retrieve that information without manually adding all those charts to my own spotify profile and then run the function `get_playlist_byUser(‘myspotify_userID’)` to retrieve the playlist ID and hence passing them to `get_audioFeatures_from_playlist('playlist.ids)` to retrieve all corresponding track's audio features.  

As mentioned earlier, this is a lightweight wrapper for accessing the Spotify API, meaning that not all the API requests [available](https://developer.spotify.com/documentation/web-api/reference/) are implemented in the package, however those unimplemented URL request can easily be made through the GET function: 

```R
> request <- GET("https://api.spotify.com/v1/browse/featured-playlists?country=DE&limit=2", params=list(limit=3, offset=0))
> request$playlists$items$name
[1] "Herbst Chillout" "OFF POP"         "Feelgood Indie" 
> request$playlists$items$id
[1] "37i9dQZF1DXaIrEwuQ3hyy" "37i9dQZF1DX07Bg0Q5GozA" "37i9dQZF1DWWM6GBnxtToT"
```

## List of all implemented functions: 

| GET                             | GET request data from Spotify with limit and offset parameters |
| ------------------------------- | ------------------------------------------------------------ |
| get_access_token                | Creates an access token to access Spotify web API.           |
| get_album_tracks                | Get Spotify catalog information about an album’s tracks.     |
| get_artist_albums               | Get Spotify catalog information about an artist’s albums.    |
| get_artist_top_tracks           | Get Spotify catalog information about an artist’s top tracks by country. |
| get_audioFeatures_from_playlist | Retrieve Audio Features of all tracks of the playlist(s) provided |
| get_audioFeatures_from_user     | Retrieve Audio Features of all tracks in all the playlist of a Spotify user |
| get_categories                  | Get a List of Categories                                     |
| get_categories_playlists        | Get a list of Spotify playlists tagged with a particular category. |
| get_multiple_audio_features     | Get audio features for multiple tracks based on their Spotify IDs. |
| get_multiple_tracks_info        | Get Spotify catalog information for multiple tracks based on their Spotify IDs. |
| get_new_release                 | Get a list of new album releases featured in Spotify         |
| get_one_audio_analysis          | Get a detailed audio analysis for a single track identified by its unique Spotify ID. |
| get_one_audio_features          | Get audio feature information for a single track identified by its unique Spotify ID. |
| get_one_playlist_info           | Get a playlist information                                   |
| get_one_tracks_info             | Get Spotify catalog information for a single track identified by its unique Spotify ID. |
| get_playlist_byUser             | Get a list of the playlists owned or followed by a Spotify user. |
| get_related_artists             | Get Spotify catalog information about artists similar to a given artist. |
| get_track_byPlaylist            | Get a Playlist's tracks                                      |
| get_user_info                   | Get public profile information about a Spotify user.         |
| search_album_byName             | Get Spotify Catalog information about albums                 |
| search_artist_byName            | Get Spotify Catalog information about artists                |
| search_byQuery                  | Get Spotify Catalog information about albums, artists, playlists, tracks, shows or episodes that match a keyword string. |
| search_playlist_byName          | Get Spotify Catalog information about playlist               |
| search_track_byName             | Get Spotify Catalog information about tracks                 |
| xGET                            | GET request data from Spotify without limit and offset parameters |

