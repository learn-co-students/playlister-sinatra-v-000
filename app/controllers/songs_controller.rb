class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/songs") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do 
    erb :new
  end

  post '/songs' do 
    song = Song.new(name: params[:name])
    song.artist = Artist.find_or_create_by(name: params[:artist])
    song.save
    redirect '/songs'
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :show
  end

end
