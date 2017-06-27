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
		@song = Song.find_by_slug(params[:slug])
		@song_name = @song.name
		@song_artist = @song.artist
		@song_genre = @song.genre
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		session[:msg] = "edit"
		session[:song] = @song
		erb :'songs/edit'
	end

	post '/songs' do
		if !@artist = Artist.find_by(name: params[:"Artist Name"])
				@artist = Artist.new(name: params[:"Artist Name"])
				@artist.url_slug = @artist.slug
				@artist.save
		end
		if !@genre = Genre.find_by_id(params[:genres][0])
			@genre = Genre.new(name: params[:genres][0])
			@genre.url_slug = @genre.slug
			@genre.save
		end
		if session[:msg] != "edit"
			# This is a new song
			@song = Song.new(name: params[:Name])
			@song.artist = @artist
			@song.genre = @genre
			@song.url_slug = @song.slug
			@song.save
			@song.song_genres.create(genre: @genre)
			@song.genre_ids = @genre.id
			flash[:message] = "Successfully created song."
			redirect to "songs/#{@song.slug}"
		else
			# This is a song being edited
			session[:song].artist = @artist
			session[:song].genre = @genre
			session[:song].save
			session[:msg] = ""
			@song = session[:song]
			session[:song] = ""
			flash[:message] = "Successfully updated song."
			redirect to "songs/#{@song.slug}"
		end
	end

end
