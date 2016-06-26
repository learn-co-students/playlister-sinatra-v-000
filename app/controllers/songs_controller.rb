class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    song = Song.new(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.save
    redirect "/songs/#{song.slug}"
  end

  post '/songs/:id' do
    song = Song.find(params[:id])
    if params[:song]
      song.update(params[:song])
    end
    if !params[:artist][:name].empty?
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      song.save
    end
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug/success' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/success'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @last = @song == Song.last
    erb :'songs/show'
  end

end