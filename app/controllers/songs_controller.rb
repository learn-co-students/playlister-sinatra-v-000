class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  # use Rake::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs' do
    # binding.pry
    @song=Song.create(name: params["Name"])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist_id = @artist.id
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    # @slug = params[:slug]
    @song = Song.find_by_slug(params[:slug])
    @genre_id = @song.song_genres[0].genre_id
    erb :"songs/show"
  end
end
