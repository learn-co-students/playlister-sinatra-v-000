class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
["blues", "greens", "reds", "rock"].each {|genre| Genre.create(name: genre)}
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist])
    genres = params[:genres].map {|genre| Genre.find_or_create_by(name: genre)}
    @song = Song.create(name: params[:name], artist: artist, genres: genres)
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    puts params
    binding.pry

    @song.name = params[:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genres = params[:genres].map {|genre| Genre.find_or_create_by(name: genre)}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end
end
