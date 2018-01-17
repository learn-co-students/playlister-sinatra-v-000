class SongsController < ApplicationController  
  use Rack::Flash  

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'    
  end

  post '/songs' do    
    @song = Song.create(:name => params[:song_name])
    @artist = Artist.find_or_create_by(:name => params[:artist_name])

    params[:genres].each do |genre_id|
      @song.genre << Genre.find(genre_id)
    end
    
    @song.artist = @artist
    @song.save 
    flash[:notice] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end   

  get '/songs/:slug/edit' do    
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'   
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.genre = params[:genres].collect {|genre_id| Genre.find(genre_id)}
    @song.save    
    flash[:notice] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end