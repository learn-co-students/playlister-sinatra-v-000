class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all.order(:name)
    erb :'songs/index'
  end

  post '/songs' do
    song = Song.create(params[:song])
    song.update(artist: Artist.find_or_create_by(params[:artist]))
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.update(artist: Artist.find_or_create_by(params[:artist]))
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end
end
