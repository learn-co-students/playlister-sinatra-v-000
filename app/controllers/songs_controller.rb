class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params["Name"]) #Creates a Song object
    artist = Artist.find_or_create_by(name: params["Artist Name"]) #Finds or creates an Artist object
    @song.artist = artist #Assigns Artist object to the Song
    params["genres"].each do |genre_id| #Assigns all the Genre objects (already existing) from an array to the song
      @song.song_genres.build(genre: Genre.find(genre_id))
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params["slug"])
    @song.update(name: params["Name"])
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist = artist
    params["genres"].each do |genre_id|
      @song.song_genres.find_or_create_by(genre: Genre.find(genre_id))
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
