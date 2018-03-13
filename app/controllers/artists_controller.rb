class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all 
		erb :'/artists/index'
	end

	get '/artists/new' do
		
		erb :'/artists/new'
	end

	get '/artists/:slug' do

		artist_id = Artist.new.id
		@song = Song.find_by(artist_id)
		@song

		artist_id = Artist.new.id
		@genre = Genre.find_by(artist_id)
		@genre



		erb :'/artists/show'
	end

end 