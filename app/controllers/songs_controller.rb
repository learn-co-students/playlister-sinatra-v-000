class SongsController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
end