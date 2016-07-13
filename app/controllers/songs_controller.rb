require 'rack-flash'
class SongsController < ApplicationController
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
    @song = Song.create(:name => params[:name])
    @song.artist = Artist.find_or_create_by(:name => params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect :"/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name]
    @song.artist = Artist.find_or_create_by(:name => params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect :"/songs/#{@song.slug}"
  end

end
