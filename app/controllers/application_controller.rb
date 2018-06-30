class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :songs
  end

  get '/artists' do
    erb :artists
  end

  get '/genres' do
    erb :genres
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs/:slug' do
    if !Artist.find_by(name: params[:artist_name])
      @artist = Artist.create(name: params[:artist_name])
    else
      @artist = Artist.find_by(name: params[:artist_name])
    end
    @song = Song.create(name: params[:song_name])
    @genre = Genre.create(name: params[:genre])
    @song.artist = @artist
    @song.genres << @genre
    @song.save

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    # @song.genres << Genre.find_by(name: params[:genre])
    # @song.save
    @song.update(artist: Artist.find_or_create_by(name: params[:artist_name]))

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_songs
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artists
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show_genres
  end



end
