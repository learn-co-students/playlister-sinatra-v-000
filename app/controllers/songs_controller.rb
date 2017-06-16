require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    puts params
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genres = Genre.find(params["genres"])
    @song.save

    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    puts params
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genres = Genre.find(params["genres"])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end

end
