class GenresController < ApplicationController

	get '/genres' do
	  @genres = Genre.all
	  erb :'/genres/index'
	end

	get '/genres/:slug' do
		@genre = Genre.find_by_slug(params[:slug])
		@genre_name = @genre.name
		@genre_artists = []
		@genre_songs = []
		@artists = Artist.all
		@artists.each do |artist|
			if artist.genre_id == @genre.id
				@genre_artists << artist
			end
    end
		@songs = Song.all
		@songs.each do |song|
			if song.genre_id == @genre.id
				@genre_songs << song
			end
    end
		erb :'/genres/show'
	end

	get '/genres/:id' do
		binding.pry
		erb :'/genres/show'
	end

end
