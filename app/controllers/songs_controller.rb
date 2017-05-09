class SongsControllers < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/songs") }
enable :sessions
use Rack::Flash


  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs/:slug' do
    @song = Song.create(:name => params[:song_name])
    @genres = params[:genres]
    @genres.each {|genre| @song.genres << Genre.find(genre)}

    if @artist = Artist.find_by_slug(params[:artist_name])
      @artist.songs << @song
    else
      @artist = Artist.create(name: params[:artist_name])
      @artist.songs << @song
    end
    @artist.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :show
  end

  get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  erb :edit
  end

  patch '/songs/:slug/' do
    @song = Song.find_by_slug(params[:slug])

    if !params[:artist_name].empty?
      @song.artist = Artist.create(name: params[:artist_name])
    end
    @genres = params[:genres]
    @song.genres.clear
    @genres.each {|genre| @song.genres << Genre.find(genre)}
    @song.save
    flash[:message] = "Successfully updated song."

    redirect to("/songs/#{@song.slug}")
    end

end
