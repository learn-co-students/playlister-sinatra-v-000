class SongsController < ApplicationController


  get '/' do
    erb :index
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  #songs slugifiable



  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    #binding.pry
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    #binding.pry
    @song.genres = params[:genres].map {|genre| Genre.find_by(name: genre)}
    #binding.pry
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:genres].map {|genre| Genre.find_by(name: genre)}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")

  end






end
