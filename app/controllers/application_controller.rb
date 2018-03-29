class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, 'secret'
  end
  
  get '/' do
    @songs = Song.all
    @genres = Genre.all
    @artists = Artist.all
    erb :index
  end
end