require 'rack-flash'

class SongsController < ApplicationController
	 use Rack::Flash

	# index
	get '/songs' do 
		@songs = Song.all
		erb :'songs/index'
	end

	# new
	get '/songs/new' do 
		@artists = Artist.all
		erb :'songs/new'
	end

	# create
	post '/songs' do 
		@song = Song.find_or_create_by(name: params[:song_name])
		@song.genre_ids = params[:genre]
		if params[:artist_name].present?
			@song.artist = Artist.find_or_create_by(name: params[:artist_name])
		end
		@song.save
		flash[:message] = "Successfully created song."
		redirect to "/songs/#{@song.slug}"
	end

	# show
	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug]) 
		erb :'songs/show'
	end

	# edit
	get '/songs/:slug/edit' do 
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	# update
	patch '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug])
		@song.genre_id = params[:genre_id]
		if params[:artist_name].present?
			@song.artist = Artist.find_or_create_by(name: params[:artist_name])
		end
  	@song.update(params[:song])
		flash[:message] = "Successfully updated song."
		redirect to "/songs/#{@song.slug}"
	end

end

