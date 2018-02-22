class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		slug = params[:slug]
		@song = Song.find_by_slug(slug)
		erb :'/songs/show'
	end

  get '/songs/:slug/edit' do
		slug = params[:slug]
		@song = Song.find_by_slug(slug)
		erb :'/songs/edit'
	end

	post '/songs/edit' do
		@song = Song.find(params[:id])
		@song.name = params["Name"] if !params["Name"].empty?
		@song.artist = Artist.find_or_create_by(name: params["Artist Name"]) if !params["Artist Name"].empty?
		@song.genre_ids = params[:genres]
		@song.save
		flash[:message] = "Successfully updated song."
		redirect :"/songs/#{@song.slug}"
	end

  post '/songs' do
		@song = Song.create(name: params["Name"])
		@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
		@song.genre_ids = params[:genres]
		@song.save
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end


end
