class SongsController < ApplicationController
	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	post '/songs/new' do
		@song = Song.create(name: params["Name"])
		#@song.song_genres = Genre.create(genre_id: params["genres"])
		if Artist.all.find_by_name(params["Artist Name"]).nil?
			artist = Artist.create(name: params["Artist Name"])
			@song.artist = artist
			@song.save
			redirect to '/songs/:slug'
		else
			artist = Artist.all.find_by_name(params[:artist])
			@song.artist = artist
			artist.save
		end
	end
end
