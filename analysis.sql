CREATE database spotify_2023;
Use spotify_2023;

select * from spotify;

Alter table spotify
rename column `artist(s)_name` to `artist_name`;

/*Top 5 most streamed songs of the year*/

SELECT track_name, streams
FROM spotify
ORDER BY streams DESC
LIMIT 10;

/*Top 5 single artists with most streamed songs*/

SELECT streams, artist_name
FROM spotify
WHERE artist_count = 1
ORDER BY streams DESC
LIMIT 10;

/*Top 5 songs with more than 1 artist*/

SELECT artist_name, streams
FROM spotify
WHERE artist_count > 1
ORDER BY streams DESC
LIMIT 10;

/*Top 5 artist with most song released*/

SELECT artist_name, count(artist_name)as total_songs_released
from spotify
group by artist_name
order by total_songs_released DESC
LIMIT 10;

/*Top songs included in the Spotify playlist*/

SELECT track_name, in_spotify_playlists as no_of_playlists
FROM spotify
ORDER BY no_of_playlists Desc;

/*Top songs included in the Apple playlist*/

SELECT track_name, in_apple_playlists as no_of_playlists
FROM spotify
ORDER BY no_of_playlists Desc;

/*percentage of songs as per release year*/

SELECT count(track_name)*100/(select count(track_name) from spotify)as percentage,released_year
FROM spotify
Group By released_year
Order by percentage desc;

/*Artist(s) with top songs released in 2023*/

SELECT artist_name, track_name, streams
FROM spotify
WHERE released_year = 2023
ORDER BY streams DESC;

/*Average streams of top 5 artists  */

SELECT artist_name, avg(streams) as average_streams
from spotify
group by artist_name
having count(artist_name)>5
order by avg(streams) DESC;






