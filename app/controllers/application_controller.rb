class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all

  end

  get '/genres' do
    @genres = Genre.all

  end

  get '/artists' do
    @artists = Artist.all
  end
end