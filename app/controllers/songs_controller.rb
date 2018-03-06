class SongsController < ApplicationController

	get '/songs' do
  	erb :'songs/index'
  end

  get '/songs/new' do
		erb :'songs/new'
	end

	post '/songs' do
		@song = Song.create(name: params[:name])

		if !params["Artist Name"].empty?
			artist = Artist.find_by(name: params["Artist Name"])
			if artist == nil
				artist = Artist.create(name: params["Artist Name"])
			end
		end

		@song.artist_id = artist.id

		SongGenre.create(song_id: @song.id, genre_id: params[:genres][0].to_i)
		@song.save
		
		flash[:message] = "Successfully created song."
		redirect to "/songs/#{@song.slug}"
	end

	get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by(name: params[:song_name])
		
		if !params["Artist Name"].empty?
				artist = Artist.find_by(name: params["Artist Name"])
				if artist == nil
					artist = Artist.create(name: params["Artist Name"])
				end
		end
		
		if params[:genres]
			@song.song_genres.each do |song_genre|
				i = 0
				song_genre.genre_id = params[:genres][i].to_i
				song_genre.save
				i+=1
			end
		end

		@song.artist_id = artist.id
		@song.save
		flash[:message] = "Successfully updated song."

		redirect to "/songs/#{@song.slug}"
	end


end