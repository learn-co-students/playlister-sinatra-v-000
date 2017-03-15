require 'rack-flash'
class SongsController < Sinatra::Base
use Rack::Flash
use Rack::MethodOverride #patch won't work and won't look in this file to find the patch method without this line

enable :sessions

set :views, Proc.new { File.join(root, "../views/") }


  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    new_song = Song.create(name: params[:name])
    new_song.artist = Artist.find_or_create_by(name: params[:artist])
    new_song.genre_ids = params[:genres]
    new_song.save

    flash[:message] = "Successfully created song."
    redirect "songs/#{new_song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

#duplicating same codes in ApplicationController somehow it won't find this code in songs controller
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end


end
