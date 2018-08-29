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
		erb :'/songs/show'
	end

	post '/songs' do 
		# @song = Song.new
		# @song.name = params[:name]
		# @song.save
		@song = Song.create(:name => params["Name"])
		@song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
		@song.genre = Genre.find_or_create_by(:name => params["Genre Name"])
		
		@song.save
		
		
		redirect to "/songs/#{@song.slug}"
	end

end