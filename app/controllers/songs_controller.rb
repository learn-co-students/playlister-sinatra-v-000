require 'rack-flash'
class SongsController < ApplicationController

 use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params['Name'])
    @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
    @song.genre_ids = params['genres']
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # value = "@song.artist.name"
    #song = @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    # 1. changed id='Artist Name'
    #Okay, this changes artist through shotgun
    # if !params[:song][:name].empty?

    redirect "/songs/#{@song.slug}"
  end

end
