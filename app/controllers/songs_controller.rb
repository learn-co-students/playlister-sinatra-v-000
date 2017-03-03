require 'rack-flash'
class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    # binding.pry
    # flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get '/songs/:slug/edit' do

  end

end
