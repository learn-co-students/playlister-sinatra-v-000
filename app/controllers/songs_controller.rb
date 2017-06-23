class SongsController < ApplicationController

	get '/songs' do
	  @songs = Song.all
	  erb :'/songs/index'
	end

	get '/songs/new' do
		binding.pry
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song_name = @song.name
		@song_artist = Artist.find_by_id(@song.artist_id)
		@song_genre = Genre.find_by_id(@song.genre_id)
		erb :'/songs/show'
	end

	get '/songs/:id' do
		binding.pry
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		binding.pry
	end

end
