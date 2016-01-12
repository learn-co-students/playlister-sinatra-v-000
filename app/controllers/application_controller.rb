class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do 
  	@songs = Song.all
  	erb :'songs/songs_list'
  end

  get '/songs/new' do 
  	erb :'songs/new'
  end

  get '/songs/:slug' do 
  	@song = Song.find_by_slug(params[:slug])
  	erb :'songs/show_song'
  end

  post '/songs/new' do 
  	@song = Song.create(:name => params["song_name"])
  	@song.artist = Artist.find_or_create_by(:name => params["artist_name"])
  	params["genre"].each do |type|
  		@song.genres << Genre.find_or_create_by(:name => type)
  	end 
  	@song.save
  	erb :"songs/show_song"
  end

  get '/artists' do 
  	@artists = Artist.all 
  	erb :'artists/artists_list'
  end 

  get '/artists/:slug' do 
  	@artist = Artist.find_by_slug(params[:slug])
  	erb :'artists/show_artist'
  end

  get '/genres' do 
  	@genres = Genre.all 
  	erb :'genres/genres_list'
  end 

  get '/genres/:slug' do 
  	@genre = Genre.find_by_slug(params[:slug])
  	erb :'genres/show_genre'
  end

 
end