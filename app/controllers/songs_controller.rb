require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  enable :sessions


  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do

    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.new(name: params[:song][:name])

    if @artist = Artist.find_by_name(params[:song][:artist][:name])
    else
      @artist = Artist.create(params[:song][:artist])
    end
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])


    redirect "/songs/#{@song.slug}"
  end
end
