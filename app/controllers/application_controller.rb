require 'rack-flash'



class ApplicationController < Sinatra::Base
  use Rack::Flash

  register Sinatra::ActiveRecordExtension
  enable :sessions 
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all 
    erb :index
  end
  
  get '/songs/new' do 
    erb :song_new
  end
  
   get '/songs/:slug' do 
    #binding.pry
    @song = Song.find_by_slug(params["slug"])
    erb :song_show
  end 
  
  post '/songs' do 
    
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    #binding.pry 
    redirect("/songs/#{@song.slug}")
  end
  
=begin
    artist = params["Artist Name"]
    genre = params["genres"]
    artist_names = Artist.all 
    if artist_names.include?(params["Artist Name"]) == false 
      t = Artist.create(:name => params["Artist Name"])
    end 
    if Song.all.include?(artist) == false 
      t.songs << Song.create(:name => params["Name"])
    end
    if Genre.all.include?(genre) == false
      Genre.create(:name => genre[0])
      Genre.last.songs << t.songs.last
    end 
    @song.save 
=end 

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params["id"])
    erb :song_edit 
  end 
  
  patch '/songs/:id' do 
    
    @song = Song.find_by_slug(params[:id])
    @song.update(params[:song])
    @song.artist = Artist.create(:name => params["Artist Name"])
    @song.genres = Genre.find(params["song"]["genre_ids"])
    @song.save 
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")  
    
    
  end 
  
  
  get '/artists' do 
    @artists = Artist.all 
    erb :artists 
  end 

  get '/artists/:slug' do 
    #binding.pry
    @artist = Artist.find_by_slug(params["slug"])
    erb :artist_show
  end 
  
  get '/genres' do 
    @genres = Genre.all
    erb :genres 
  end 
  
  get '/genres/:slug' do 
    #binding.pry
    @genre = Genre.find_by_slug(params["slug"])
    erb :genre_show
  end 
  
end