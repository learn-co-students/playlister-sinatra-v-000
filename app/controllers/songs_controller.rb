require 'sinatra/base'
require 'rack-flash'

class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    puts params
    @song = Song.create(name: params["Name"], genre_ids: params["genres"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    puts params
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    puts params
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    puts params
    @song = Song.find_by_slug(params["slug"])
    @song.name = params["Name"]
    @song.genre_ids = params["genres"]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
