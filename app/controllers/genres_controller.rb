class GenresController < ApplicationController

	get '/genres' do
		@genres = Genre.all 
		erb :'/genres/index'
	end

	get '/genres/new' do
		
		erb :'/genres/new'
	end

	get '/genres/:slug' do
		genre_id = Genre.new.id
		@artist = Artist.find_by(genre_id)
		@artist

		songs_genres = SongGenre.new.genre_id
		@song = Song.find_by(songs_genres)
		@song


		erb :'/genres/show'
	end

end 