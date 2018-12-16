class SongsController < ApplicationController

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/' do
    song=Song.create({name: params[:name]})
    song.artist=Artist.find_or_create_by(name: params[:artist_name])
    song.genres << params[:genres].collect {|genre| Genre.find(genre)}
    song.save
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug' do
    song=Song.find_or_create_by({name: params[:name]})
    song.artist=Artist.find_or_create_by(name: params[:artist_name])
    song.genres << params[:genres].collect {|genre| Genre.find(genre)}
    song.save
    redirect to "/songs/#{song.slug}"
  end

end
