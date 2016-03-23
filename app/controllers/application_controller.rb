class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
  	@songs = Song.all
    erb :songs
  end

  get '/artists' do 
  	@artists = Artist.all
  	erb :artists
  end

  get '/genres' do 
  	@genres = Genre.all
  	erb :genres
  end

  get '/songs/new' do 
  	erb :'song/new'
  end

  post '/songs' do 
  	
  	@song = Song.new(name: params["Name"])
  	#binding.pry
  	@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
  	params[:genres].each do |genre|
  		@song.genres << Genre.find(genre)
  	end
  	@song.save
  	
  	erb :show_song, locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do 
  	@song = Song.find_by_slug(params[:slug])
  	erb :'song/edit'
  end

  post '/songs/:slug' do 
  	@song = Song.find_by_slug(params[:slug])
  	@song.artist = Artist.find_or_create_by(name: params["Artist Name"]) unless params["Artist Name"].empty?
  	params[:genres].each do |genre|
  		@song.genres << Genre.find(genre)
  	end
  	@song.save
  	#binding.pry
  	erb :show_song, locals: {message: "Song successfully updated."}
  end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	erb :show_song
  end

  get '/artists/:slug' do
  	@artist = Artist.find_by_slug(params[:slug])
  	erb :show_artist
  end

  get '/genres/:slug' do
  	@genre = Genre.find_by_slug(params[:slug])  
  	erb :show_genre
  end

 
  
end