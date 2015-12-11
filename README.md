# Sinatra Playlister

##Objectives 

* Solidify your ActiveRecord understanding 
* Build out basic views for all your models
* Create forms for editing and creating a new song that returns a well-structured params hash 


### Overview

In the theme of moving from simple command line application to static website to dynamic web app, it's time to move Playlister to the interwebs using Sinatra. In this lab, you'll be:

  1. Giving our "library" of songs a dynamic web interface
  2. Creating a few complex forms that allow you to create and edit Artists, Songs and Genres.

### Instructions

The first thing you should aim to do is create a Sinatra interface for the data in `db/data`. There is a `LibraryParser` class included in the `lib` folder that you may use, though it may need some tweaking to work with your specific application. Your associations should follow this pattern:

1. An Artist can have multiple songs and multiple genres
2. A Genre can have multiple artists and multiple songs
3. A Song can belong to ONE Artist and multiple genres
4. There will be a join table needed somewhere here

You should build the following routes:

1. `/songs`
  * This should present the user with a list of all songs in the libaray.
  * Each song should be a clickable link to that particular song's show page.
2. `/genres`
  * This should present the user with a list of all genres in the library.
  * Each genre should be a clickable link to that particular genre's show page.
3. `/artists`
  * This should present the user with a list of all artists in the library.
  * Each artist should be a clickable link to that particular artist's show page.
4. `/songs/:slug`
  * Any given song's show page should have links to that song's artist and the each genre associated with the song.
5. `/artists/:slug`
  * Any given artist's show page should have links to each of his or her songs and genres.
6. `/genres/:slug`
  * Any given genre's show page should have links to each of its artists and songs.

To get the data into your database, you will want to figure out how to use your `LibraryParser` class in the `db/seeds.rb` file.


### How to approach this lab

Get the basics of the app working first, which means we have five specs in total and you should first pass all three model specs. 

By typing 

```bash
rspec spec/models/01_artist_spec.rb 
```

in your bash/ command line you will only run that spec. It is important to run the specs in there numeric order. You will notice even after adding a table, model, and controller your specs are still not passing, but the error messages are changing. You have to read every errror message carefully to understand what to do next.

For the last spec `05_song_form_spec.rb` you need to implement the following features:

1. `/songs/new`
  * I should be able to create a new song
  * Genres should be presented as checkboxes
  * I should be able to enter the Artist's name in a text field (only one Artist per song.)
2. `/songs/:slug/edit`
  * I should be able to change everything about a song, including the genres associated with it and its artist.

Think about the custom writer or writers you may need to write to make these features work. 

### Slugs

Having a URL like `/songs/1` sort of sucks. Imagine trying to email that song to a friend. They would literally have no idea what the song would be until they click the link. You could be sending them literally anything. It would be much better to have a URL like `/songs/hot line bling`.

But again, we run into a problem here. We can't have spaces in a URL. In order to make it a proper URL, we have to convert the spaces to `-` in the song name. This is called a slug.

You are going to need to create some slugs in this lab. A slug is used to create a name that is not acceptable as a URL for various reasons (special characters, spaces, etc). This is great because instead of having a route like `/songs/1`, you can have a route `/songs/hotline-bling` which is a much more descriptive route name.

Each class you build will need to have a method to slugify each object's name. This means you'll need to strip out any special characters, and replace all spaces with `-`. 


### Resources
* [Clean ULR - Slugs](http://en.wikipedia.org/wiki/Slug_(web_publishing)#Slug)

<a href='https://learn.co/lessons/playlister-sinatra' data-visibility='hidden'>View this lesson on Learn.co</a>
