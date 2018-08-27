class SongsController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    erb :'/songs/new'
  end
  
  get '/songs/show' do
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !@song.nil?
      @artist = Artist.find(@song.artist_id)
    end

    erb :'/songs/show'
  end
  
  post '/songs/:slug' do
    redirect to '/songs/show'
  end
  
  get '/songs/:slug/edit' do
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
  end
end