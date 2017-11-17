require 'rack-flash'
require 'pry'

class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_id = params[:genres]
    flash[:message] = "Successfully created song."
    @song.save
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

  post '/songs/:slug' do #this updates the song
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    if !params[:genre_ids][].empty?
      @song.genres << Genre.find_or_create_by(id: params[:genre_ids])
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
