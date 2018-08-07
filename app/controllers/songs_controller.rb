class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    genre_id = SongGenre.find_by_id(@song.id).genre_id
    @genre = Genre.find_by_id(genre_id)
    erb :'/songs/show'
  end


  get 'songs/new' do
    erb :'new'
  end

  post 'songs/new' do
    binding.pry
    song = params
    #name and artist id
  end

end
