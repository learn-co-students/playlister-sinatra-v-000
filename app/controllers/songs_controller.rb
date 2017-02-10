class SongsController < ApplicationController
	
	get '/songs' do
		@songs = Song.all
		erb :'songs/index'
	end

	get '/songs/new' do
		erb :'songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end

	post '/songs' do
		@song = Song.create(:name => params[:song][:name])
		artist_name = params[:song][:artist_name]
		@artist = Artist.find_by(:name => artist_name)
		
		if params[:song][:artist_name] && !@artist
			@song.build_artist(:name => artist_name)	
		else
			@song.artist = @artist
		end
		@song.save
		
		if genre_ids = params[:song][:genre_ids]
			genre_ids.each do |genre_id|
				@song.genres << Genre.find(genre_id)
			end	
		end
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	post '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		if params[:song][:artist_name] != ""
			if @artist = Artist.find_by(:name => params[:song][:artist_name])
				@song.artist = @artist
			else
				@song.create_artist(:name => params[:song][:artist_name])
			end
		end
		@song.save
		
		@song.genres.clear
		
		if genre_ids = params[:song][:genre_ids]
			genre_ids.each do |genre_id|
				@song.genres << Genre.find(genre_id)
			end	
		end
		@song.save
		@message = "Successfully updated song."
		erb :'songs/show'
	end

end