class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		
		erb :'songs/index'
	end

	get '/songs/new' do
		@artists = Artist.all
		@genres = Genre.all
		erb :'songs/new'
	end

	post '/songs' do
	
		@song = Song.new(name: params[:song]["name"])

		potential_artist = Artist.find_by(name: params[:song]["artist"])
		
		if potential_artist
			@song.artist = potential_artist
		else
			@song.build_artist(name: params[:song]["artist"])
		end
		@song.genres.build(name: params[:song]["genres"])


		if @song.save
			@songs = Song.all
		 	redirect "/songs/#{@song.slug}"
		else
			erb :'songs/new'
		end
	end

	get '/songs/:slug' do
		# binding.pry
		@song_message = Song.creation_message if Song.creation_message
		@song = Song.find_by_slug(params[:slug])
		
		erb :'songs/show'
	end

	get '/songs/:slug/edit' do
		@artists = Artist.all
		@genres = Genre.all
		@song = Song.find_by_slug(params[:slug])
		erb :"songs/edit"
	end

	patch '/songs/:slug' do 
		# binding.pry
		@song = Song.find_by_slug(params[:slug])
		@song.name = params[:song][:name]

		unless params[:song][:artist].empty?
			@song.artist = Artist.find_or_create_by(name: params[:song][:artist])
		else
			@song.artist = Artist.find_or_create_by(name: params[:song][:artist_checked])
		end

		# binding.pry
		genres = params[:song][:genres]
		
		@song.genres = genres.map do |genre|
						Genre.find_or_create_by(name: genre)
					  end

		if @song.save
			@songs = Song.all
			@song_message = "Successfully updated song."
		 	erb :'songs/show'
		else
			redirect '/songs/:slug/edit'
		end
	end

end

