require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
	enable :sessions
	use Rack::Flash

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	post '/songs' do
		@song = Song.new(name: params["Name"])
		@artist = Artist.find_by(name: params["Artist Name"])
		@genres = Genre.find_by(name: params["genre"])

		params[:genre].each do |this_name|
			@song.genres << Genre.find_by(name: this_name)
		end
		@song.save
		if @artist == nil
			@artist = Artist.new(name: params["Artist Name"])
			@artist.save
			@song.artist_id = @artist.id
			@song.save
		else
			@song.artist_id = @artist.id
			@song.save
		end


		flash[:message] = "Successfully created song."
		redirect to "/songs/#{@song.slug}"
	end

	get '/songs/new' do
		@song = Song.new
		@genres = Genre.all
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params["slug"])
		erb :'/songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params["slug"])
		@artist = Artist.find_by(name: params["Artist Name"])
		if params["Artist Name"] != ""
			if @artist == nil
				@artist = Artist.new(name: params["Artist Name"])
				@artist.save
				@song.artist_id = @artist.id
				@song.save
			else
				@song.artist_id = @artist.id
				@song.save
			end
		end
		if params[:genre] != nil
			@song.genres = []
			params[:genre].each do |this_name|
				@song.genres << Genre.find_by(name: this_name)
			end
		end
		@song.save
		flash[:message] = "Successfully updated song."
		redirect to "/songs/#{@song.slug}"
	end


end
