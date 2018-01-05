class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Sinatra::Flash

  get '/songs/new' do
    @song = Song.new
    erb :'/songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params["Song Name"])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist = @artist
    @genre = SongGenre.create(genre: Genre.find(params["genres"][0].to_i))
    @song.song_genres << @genre
    @song.save
    flash[:message] = "Successfully Created a Song!"
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["Song Name"] unless params["Song Name"].empty?
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"]) unless params["Artist Name"].empty?
    @song.song_genres = []
    params["genres"].each do |genre|
      @song.song_genres << SongGenre.find_or_create_by(genre: Genre.find(genre.to_i))
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
