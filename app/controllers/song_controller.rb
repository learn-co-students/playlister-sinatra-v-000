require 'pry'
class SongController < Sinatra::Base
  set :views, 'app/views'

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.find_or_create_by(name: params["Name"], artist: @artist)
    @song.genre_ids = params[:genre_ids]
    #binding.pry
    @song.save
    erb :'songs/show', locals: {message: "Successfully created song."}
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(@song.artist_id)
    @genres = Genre.all
    @genre = @genres.find_by(id: @song.genre_ids)
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @genre_name = @genres.find_by(id: @song.genre_ids).name
    #binding.pry
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    #binding.pry
    params[:item].inspect
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["Name"]
    @song.save

    erb :'songs/show', locals: {message: "Successfully updated song."}
  end




end
