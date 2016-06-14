class SongsController < Sinatra::Base

  get '/songs' do 
    @songs = Song.all
    erb :index
  end
end