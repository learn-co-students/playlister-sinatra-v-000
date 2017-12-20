class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end

# /songs shows all the songs
# @songs = Song.all
# each song is an a href to that show page

# same for genres and artists
