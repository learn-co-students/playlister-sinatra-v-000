class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs/") }
  
  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end
end