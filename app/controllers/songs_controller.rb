class SongsController < Sinatra::Base
enable :sessions
use Rack::Flash
set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  @song = Song.new(name: params[:name])
  params[:genres].each do |genre_id|
    @song.genres << Genre.find(genre_id)
  end
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:name].empty?
      @song.update(name: params[:name])
    end 
    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    erb :'/songs/show'
    end



end
