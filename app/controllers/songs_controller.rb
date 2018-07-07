class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:name])
    params[:genres].each do |genre|
      genre = Genre.find(genre)
      @song.song_genres.build(:genre => genre).save
    end

    artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.artist = artist
    @song.save
    flash[:notice] = "Successfully created song."
    
    redirect "/songs/#{@song.id}"
  end
  
  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'/songs/edit'
  end
  
  
  patch '/songs/:id' do 
    # raise params.inspect
    @song = Song.find(params[:id])
    new_artist = params[:song][:artist]
    new_genre = Genre.find(params[:song][:genres])
    
    
    if @song.artist.name != new_artist
      @song.artist = Artist.create(:name => new_artist)
    end
    
    if new_genre
      @song.genres = []
      @song.genres << new_genre
    end
    
    @song.save

    # "#{@song.id} #{@song.name} #{new_artist}"
    redirect "/songs/#{@song.id}"
  end
  
end