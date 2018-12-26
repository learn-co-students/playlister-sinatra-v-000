class SongsController < ApplicationController
  
  use Rack::Flash
  
  get "/songs" do 
    @songs = Song.all
    erb :"/songs/index"
  end 
  
  get "/songs/new" do
    @error = nil 
    @genres = Genre.all
    erb :"/songs/new"
  end 
  
  post "/songs" do
    #binding.pry 
    song = Song.find_by(name: params[:song][:name])
    art = Artist.find_by(name: params[:artist][:name])
    if song == nil 
      @song = Song.new(params[:song])
      if art == nil 
        @song.create_artist(params[:artist])
        @song.genre_ids= (params[:genres])
        @song.save
      else
        @song.artist = art 
        @song.genre_ids= (params[:genres])
        @song.save
      end 
      flash[:message] = "Successfully created song."
      redirect :"/songs/#{@song.slug}"
    else 
      @error = "This song already exists"
      redirect :"/songs/new"
    end 
    #artist = Artist.new(params[:artist])
    #artist.songs.build(params[:song])
    #artist.save 
  end 
  
  get "/songs/:slug" do 
    #binding.pry 
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres 
    erb :"/songs/show"
  end 
  
  get "/songs/:slug/edit" do 
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artist = @song.artist 
    erb :"/songs/edit"
  end 
  
  patch "/songs/:slug" do 
    #binding.pry 
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.genre_ids = (params[:genres])
    @artist = Artist.find_by(name: params[:artist][:name])
    if @artist == nil 
      @song.artist.update(params[:artist])
    else 
      @song.artist = @artist
    end 
    flash[:message] = "Successfully updated song."
    redirect :"/songs/#{@song.slug}"
  end 
end