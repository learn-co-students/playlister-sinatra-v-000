class SongsController < ApplicationController

	get '/songs' do
	  @songs = Song.all
	  erb :'/songs/index'
	end

	get '/songs/new' do
		@genres = Genre.all
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		binding.pry
		@song = Song.find_by_slug(params[:slug])
		# @song.artist = Artist.find_by_id(@song.artist_id)
		# @song.genre = Genre.find_by_id(@song.genre_id)
		# @song.save
		@song_name = @song.name
		@song_artist = @song.artist
		@song_genre = @song.genre
		erb :'/songs/show'
	end

	get '/songs/:id' do
		binding.pry
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		binding.pry
	end

	post '/songs' do
		@song = Song.new(name: params[:Name])
		@genre = Genre.find_by_id(params[:genres][0])
		if !@artist = Artist.find_by(name: params[:"Artist Name"])
			@artist = Artist.new(name: params[:"Artist Name"])
			# @artist.genre = @genre
			@artist.save
		end
		@song.artist = @artist
		@song.genre = @genre
		@song.save
		redirect to "songs/#{@song.slug}"
	end

end
