class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end
  
  
  
  post '/songs' do 
    
    song = Song.create(:name => params[:name])
    # genre = Genre.find_or_create_by(:name => genre)
    
    genres = []
    params[:genres].each do |genre|
      genres << Genre.find_or_create_by(:name => genre)
      song.song_genres.build(:genre => genre)
    end 
    
    artist = Artist.find_or_create_by(:name => params[:artist_name])

    # song.song_genres.build(:genre => genre)
    song.artist = artist
    
    # binding.pry
    #if artist exists
    #create new song and associate it
    
    redirect to '/songs/#{song.slug}'
  end




  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all 
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



end
