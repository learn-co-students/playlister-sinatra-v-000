class SongController < ApplicationController
	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do 
		@artists = Artist.all
		@genres = Genre.all
		erb :'/songs/new'
	end

	get '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug])
		if session[:song] == "new"
			@current_song = "new"
			session[:song] = ""
		elsif session[:song] == "edit"
			@current_song = "edit"
			session[:song] = ""
		end
		erb :'/songs/show'
	end

	post '/songs' do 
		# @song = Song.new(name: params[:name]) 

		song = Song.find_by(name: params[:name])

		if !!song
			if song.artist.name  == params["Artist Name"]
				session[:new_song] = ""
				redirect to "/songs/#{song.slug}"
			end
		else	
			song = Song.new(name: params[:name])	
		end

		artist = Artist.find_by(name: params["Artist Name"])


		if !artist
			artist = song.build_artist(name: params["Artist Name"])
		end

		if params["Genre Name"] == ""
			genre = Genre.find(params[:genre_id])
		else
			genre = Genre.new(name: params["Genre Name"])
		end

		song.artist = artist
		song.genres <<  genre
		song.save

		session[:song] = "new"
		redirect to "/songs/#{song.slug}"
	end

	get '/songs/:slug/edit' do 
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		erb :'/songs/edit'
	end

	patch '/songs/:slug' do 
		song = Song.find_by_slug(params[:slug])

		song.name = params["Song Name"] if params["Song Name"] != ""

		if params["Artist Name"] != ""
			song.artist.name = params["Artist Name"] 
		end

		song.genres.clear 

		params["genre_id"].each do |genre|

			song.genres << Genre.find(genre)
		end

		song.save
		song.artist.save
		session[:song] = "edit"
		redirect to "/songs/#{song.slug}"


	end
end