require 'pry'
class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/songs' do
    @song = Song.all
    erb :"/songs/index"
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end
  
  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params[:Name], artist: @artist)
    if params["genres"]
      params["genres"].each do |genre_id|
        genre = Genre.find_by_id(genre_id.to_i)
        @song.genres << genre
      end
    end
    erb :"/songs/show", locals: {message: "Successfully created song."}
  end
  
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end
  
  get '/songs/:slug/edit' do 
    Genre.create(name: "Big Bad Land")
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end
  
  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    if params["Name"] != ""
      @song.name = params["Name"]
    end
    
    if params["Artist Name"] != ""
      @artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.artist = @artist 
      @artist.songs << @song
    end

    if params["genres"]
      params["genres"].each do |genre_id|
        genre = Genre.find_by_id(genre_id.to_i)
        @song.genres << genre
      end
    end
    erb :"/songs/show", locals: {message:"Song successfully updated."}
    end

  
  
end