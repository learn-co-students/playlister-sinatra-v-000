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
    song = Song.new(name: params[:Name])
    song.artist = Artist.find_or_create_by(name: params[:artist])
    params[:genres].map do |f|
      genre = Genre.find(f)
      song.genres << genre
    end
    song.save
    erb :show, locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:Name])
    @artist = @song.artist.update(name: params[:artist]) 
    @song.save
    # binding.pry
    erb :show, locals: {message: "Song successfully updated."}
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :show
  end

  
  

end