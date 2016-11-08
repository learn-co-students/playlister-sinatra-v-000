class SongsController < ApplicationController

  get '/' do

  end

  get '/songs' do
    #presents user list of all songs in lib.
    #each song should be clickable link
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    #be able to create new song
    #genres should be presented as checkboxes
    #be able to enter artist's name in text field(1 per song)
    #binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    #binding.pry
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    #binding.pry
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # any given song's show page should have links to that song's
    #artist and each genre assoc. w/ the song.
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    #be able to change everything about song, including
    #genres associated w/it and its artist. think about custom
    #writer or writers you may need to write to make work.
  end
end
