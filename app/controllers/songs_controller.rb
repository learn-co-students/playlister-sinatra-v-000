class SongsController < Sinatra::Base

  get '/songs' do
    @Songs = Song.all
    erb :'/songs/index'
  end
end
