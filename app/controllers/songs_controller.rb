class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new'
  end

  post '/songs/:slug' do
    song = Song.create(name: params["song_name"])
    song.genre_ids = params["genre"]

    artist = Artist.find_by(name: params["artist_name"])

    if !artist
      new_artist = Artist.create(name: params["artist_name"])
      song.artist = new_artist
      song.save
      new_artist.save
    else
      song.artist = artist
      song.save
      artist.save
    end

    genre = Genre.find_by(id: params["genre"]) #WORKING ON
    #FYI TO SELF: trying to update genre.name from 'New Age Garbage' to 'Hippity Hop'

    redirect "/songs/#{song.slug}" #moves to GET '/songs/:slug'
  end

  get '/songs/:slug' do
    slug = params["slug"]
    @song = Song.find_by_slug(slug)
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


  get '/songs/:slug/edit' do

    slug = params["slug"] #do I need this?

    @song = Song.find_by_slug(slug) #do I need this?
    @genres = Genre.all

    erb :'songs/edit'
  end

end
