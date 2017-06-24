class ArtistsController < ApplicationController

	get '/artists' do
	  @artists = Artist.all
	  erb :'/artists/index'
	end

	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])
		@artist_name = @artist.name
		@artist_songs = []
		@artist_genres = []
		@songs = Song.all
		@songs.each do |song|
			if song.artist_id == @artist.id
				@artist_songs << song
			end
    end
		binding.pry
		erb :'/artists/show'
	end

	get '/artists/:id' do
		binding.pry
		erb :'/artists/show'
	end

end
