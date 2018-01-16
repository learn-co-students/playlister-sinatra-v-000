class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs/") }
  
  get '/songs' do
    @songs = Song.all
    erb :index
  end
end