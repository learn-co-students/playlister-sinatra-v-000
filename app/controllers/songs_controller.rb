class SongsController < ApplicationController

	get '/songs' do
    	@songs = Song.all
    	erb :'/songs/index'
  	end

  	get '/songs/new' do
    	erb :'/songs/new'
  	end

  	get '/songs/:slug' do
    	@song = Song.find_by_slug(params[:slug])
    	erb :'songs/show'
  	end

  	get '/songs/:slug/edit' do 
    	@song = Song.find_by_slug(params[:slug])
    	erb :'/songs/edit'
  	end

  	post '/songs' do

    	@song = Song.create(name: params["Name"])
    	@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    	@song.genre_ids = params[:genres]
    	@song.save
    	flash[:message] = "Successfully created song."
  		redirect to("/songs/#{@song.slug}")
  	end

  	patch '/songs/:slug' do
    	@song = Song.find_by_slug(params[:slug])
    	@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    	@song.genre_ids = params[:genres]
    	@song.update(name: params["Name"], name: params["Artist Name"], name: params["genre"])
    	flash[:message] = "Successfully updated song."
  		redirect to("/songs/#{@song.slug}")
  	end
end