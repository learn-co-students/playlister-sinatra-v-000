class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  configure do
    enable :sessions
  end
  
  get '/' do
    erb :index
  end
  
  get '/load-database' do
    LibraryParser.parse #(Run once to insert songs into database)
  end
  
  get '/songs' do
    @song_list = Song.all
    session[:message] = nil
    erb :songs
  end
  
  get '/songs/new' do
    erb :'songs/new'
  end
  
  post '/songs' do
    artist = Artist.all.find { |a| a.name == params[:artist] }
    artist = Artist.create(name: params[:artist])
    @song = Song.create(name: params[:name], artist: artist)
    genre_ids = params[:genres]
    
    genre_ids.each do |id|
      genre = Genre.all.find { |g| g.id == id.to_i }
      @song.genres << genre
    end
    
    erb :'songs/show', locals: {message: "Successfully created song."}
  end
  
  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.all.find { |song| song.slug == slug }
    erb :'songs/show', locals: {message: session[:message]}
  end
  
  get '/songs/:slug/edit' do
    @song = Song.all.find { |song| song.slug == params[:slug] }
    if @song.nil?
      redirect '/songs'
    end
    erb :'songs/edit'
  end
  
  post '/songs/edit' do
    artist = Artist.all.find { |a| a.name == params[:artist] }
    artist ||= Artist.create(name: params[:artist])
    @song = Song.all.find { |song| song.id == params[:id].to_i}
    @song.name = params[:name]
    @song.artist = artist
    genre_ids = params[:genres]
    
    genre_ids.each do |id|
      genre = Genre.all.find { |g| g.id == id.to_i }
      @song.genres << genre
    end
    @song.save
    
    session[:message] = "Song successfully updated."
    redirect "/songs/#{@song.slug}"
    # erb :'songs/show', locals: {message: "Song successfully updated."}
  end
  
  get '/artists' do
    @artist_list = Artist.all
    erb :artists
  end
  
  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.all.find { |artist| artist.slug == slug }
    erb :'artists/show'
  end
  
  get '/genres' do
    @genre_list = Genre.all
    erb :genres
  end
  
  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.all.find { |genre| genre.slug == slug }
    erb :'genres/show'
  end
  
end