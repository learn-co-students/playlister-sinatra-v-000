class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Songs.all
    erb :songs
  end
  
  get '/genres' do
    @genres = Genre.all

    erb :genres
  end
  get '/artist' do
    @artist = Artist.all

    erb :artists
  end

  get '/songs/new' do

    erb :new
  end
  
  get '/songs/:slug' do


  end
end