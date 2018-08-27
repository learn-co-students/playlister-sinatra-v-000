class SongsController < Sinatra::Base
  
  get '/songs/' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
end