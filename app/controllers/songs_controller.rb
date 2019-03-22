require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :'songs/show'
  end

  post '/songs' do
   @song = Song.create(:name => params["Name"])
   @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
   @song.genre_ids = params[:genres]
   @song.save

   flash[:message] = "Successfully created song."
   redirect to("/songs/#{@song.slug}")
  end 
  
end