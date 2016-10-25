require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song= Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  patch '/songs/:slug/edit' do
    @song = Song.find_by_id(params[:id])
    @song.update(name: params[:name], artist: params[:artist], genres: params[:genres])
    @song.save
    erb :'songs/show'
  end
end
