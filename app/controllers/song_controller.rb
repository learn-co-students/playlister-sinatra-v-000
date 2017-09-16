class SongController < ApplicationController
  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs' do
    artist = Artist.find_id_or_create_new_by_name(params["Artist Name"])
    genres = params["genres"].collect {|id| Genre.find(id)}
    @song = Song.create(name: params["Name"], artist_id: artist_id, genres: genres)
    redirect to ("/songs/#{song.slug}")
  end

end
