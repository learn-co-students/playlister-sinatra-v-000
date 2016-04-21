class SongsController < ApplicationController
 	
 	get '/songs' do  
		@songs = Song.all 
		erb :'/songs/index'
	end

	get '/songs/new' do  
  	erb :'songs/new'
  end

  get '/songs/:slug' do
		@song=Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end
	
	post '/songs' do
    #binding.pry
		@song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:genres]
    @song.save
		erb :'/songs/show', locals: {message: "Successfully created song."}
	end

  get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
  	erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song= Song.find_by_slug(params[:slug])
    #binding.pry
    @song.update(params[:song])
    if !(params[:artist][:name]).empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end

end