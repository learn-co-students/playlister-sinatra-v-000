class SongsController < ApplicationController 

	get '/songs' do 
  	@songs = Song.all
  	erb :'songs/songs_list'
  end

  get '/songs/new' do 
  	erb :'songs/new'
  end

  get '/songs/:slug/edit' do 
  	@song = Song.find_by_slug(params[:slug])
  	erb :'songs/edit'
  end

  get '/songs/:slug' do 
  	@song = Song.find_by_slug(params[:slug])
  	erb :'songs/show_song'
  end

  post '/songs/:slug' do 
  	@song = Song.find_by_slug(params[:slug])
  	@song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  	@song.genre_ids = params[:genres]
  	@song.save 
  	erb :'songs/show_song', :locals => {:message => "Song Seuccessfully update."}
  end

  post '/songs/new' do 
  	@song = Song.create(:name => params["Name"])
  	@song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  	@song.genre_ids = params[:genres]
  	@song.save
  	erb :"songs/show_song", :locals => {:message => "Successfully created song."}
  end

end