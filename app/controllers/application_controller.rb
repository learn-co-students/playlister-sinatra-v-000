class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  enable :sessions
  use Rack::Flash
  
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
  	@songs = Song.all

  	erb :'/songs/index'
  end

  get '/songs/new' do
  	@artists = Artist.all
  	@genres = Genre.all
  	erb :'/songs/new'
  end

  post '/songs' do
  	if !params[:song].keys.include?("artist_id")
  		new_artist = Artist.find_or_create_by(params[:artist])
  		params[:song][:artist_id] = new_artist.id
  	end
  	
  	new_song = Song.create(params[:song])
  	#new_song.artist = new_artist
  	new_song.save

  	flash[:message] = "Successfully created song."
  	
  	redirect "/songs/#{new_song.slug}"
  end

  get '/songs/:slug' do
  	
  	@song = Song.find_by_slug(params[:slug])
  	#@artist = @song.artist
  	#@genres = @song.genres

  	erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
  	@artists = Artist.all
  	@genres = Genre.all

  	erb :'/songs/edit'
  end

  patch '/songs/:slug' do

  	if !params[:song].keys.include?("genre_ids")
  		params[:song][:genre_ids] = []
  	end
  	
  	@song = Song.find_by_slug(params[:slug])
  	@song.update(params[:song])

  	if !params[:artist][:name].empty?
  		@song.artist = Artist.find_or_create_by(params[:artist])
  		@song.save
  	end
  	flash[:message] = "Successfully updated song."
  	redirect "/songs/#{@song.slug}"
  end

  get '/artists' do
  	@artists = Artist.all

  	erb :'/artists/index'
  end

  get '/artists/new' do
  	erb :'artists/new'
  end

  post '/artists' do
  	@artist = Artist.create(params)


  	redirect '/artists'
  end

  get '/artists/:slug' do
  	@artist = Artist.find_by_slug(params[:slug])
  	@songs = @artist.songs

  	erb :'/artists/show'
  end

  get '/genres/new' do

  end

  get '/genres' do
  	@genres = Genre.all

  	erb :'/genres/index'
  end

  get '/genres/:slug' do
  	@genre = Genre.find_by_slug(params[:slug])
  	@artists = @genre.artists
  	@songs = @genre.songs

  	erb :'/genres/show'
  end
end