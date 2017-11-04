Class SongsController < Sinatra::Base

  get '/songs' do
      @songs = Songs.all
      erb :'/songs'
  end



end
