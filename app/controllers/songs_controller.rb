require 'rack-flash'
class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song"]["name"])
    @song.artist = Artist.find_or_create_by(:name => params["artist"]["name"])
    @song.genres << Genre.find_or_create_by(:id => params[:genres])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do #this updates the song
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    if !params[:genre_ids].empty?
    #@song.genre_ids = params[:genre_ids]
     @song.genres << Genre.find_or_create_by(id: params[:genre_ids])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
