class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end


end