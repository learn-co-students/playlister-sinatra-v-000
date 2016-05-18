class SongsController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"

  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get "/songs/new" do
    erb :new
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist_name])
    @song = Song.create(name: params[:song_name], artist: artist)
    params[:genres].each {|id| @song.genre_ids = id}
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    params[:genres].each {|id| @song.genre_ids = id}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
  
end