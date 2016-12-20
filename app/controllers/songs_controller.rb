require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.new(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
      @song.save
    end
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    puts "we made it."
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
      @song.save
    end
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end

end
