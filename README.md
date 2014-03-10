---
tags: sinatra, orm, active record
languages: ruby
---

# Sinatra Playlister

In the theme of moving from simple command line application to static website to dynamic web app, it's time to move Playlister to the interwebs using Sinatra. In this lab, you'll be:

  1. Giving our "library" of songs a dynamic web interface
  2. Creating a few complex forms that allow you to create and edit Songs, Artists and Genres.

## Instructions

The first thing you should aim to do is create a Sinatra interface for the data in `db/data`. There is a `LibraryParser` class included in the `lib` folder that you may use, though it may need some tweaking to work with your specific application. I should be able to visit the following routes:

1. `/songs`
  * This should present me with a list of all songs in the libaray.
  * Each song should be a clickable link to that particular song's show page.
2. `/genres`
  * This should present me with a list of all genres in the library.
  * Each genre should be a clickable link to that particular genre's show page.
3. `/artists`
  * This should present me with a list of all artists in the library.
  * Each artist should be a clickable link to that particular artist's show page.
4. `/songs/:slug`
  * Any given song's show page should have links to that song's artist and the each genre associated with the song.
5. `/artists/:slug`
  * Any given artist's show page should have links to each of his or her songs and genres.
6. `/genres/:slug`
  * Any given genre's show page should have links to each of its artists and songs.

Notice that there are no forms involved yet. Get the basics of the app working first, and then move on to implementing the following features:

