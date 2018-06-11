class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		@genres = Genre.all
		erb :'/songs/new'
	end

	post '/songs/new' do 
	   # binding.pry
		@song = Song.create(params[:song])
		if !Artist.find_by_name(params[:artist][:name])
			@artist = Artist.create(params[:artist])
		else
			@artist = Artist.find_by_name(params[:artist][:name])
		end
		if !params[:genre][:id].empty?
			@genre = Genre.find_by_id(params[:genre][:id])
		else
			@genre = Genre.create(params[:genre])
		end
		@song.song_genres.create(genre: @genre)
		@song.artist = @artist
		@song.save
		if @song.save
			redirect "/songs/#{@song.slug}"
		else
			redirect '/failure'
		end
		
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		erb :'/songs/edit'
	end

	post '/songs/:slug/edit' do
		# binding.pry
		@song = Song.find(params[:song][:id])
		@artist = Artist.find(params[:artist][:id])
		if @artist.name != params[:artist][:name]
			@artist.update(params[:artist])
		end
		redirect "/songs/#{@song.slug}"
	end




















end