require 'rack-flash'

class SongsController < ApplicationController
	use Rack::Flash

	get '/songs' do 
		@songs = Song.all

	  erb :'songs/index'

	end

	
	get '/songs/new' do

	  @genres = Genre.all
	  erb :'songs/new'
	end

	post '/songs' do

		@song = Song.create(name: params[:song][:name])

		if Artist.find_by(name: params[:song][:artist]) == nil
			@artist = Artist.create(name: params[:song][:artist])
		else
			@artist = Artist.find_by(name: params[:song][:artist])
		end



		@song.artist = @artist


		params[:genres].each do |genre|

		  song_genre = Genre.find_by(id: genre)
		  @song.genres << song_genre			 

		end

		@song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")

		# redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug' do 
	

		@song = Song.find_by_slug(params[:slug])
		


	
		erb :'songs/show'
	end

	get '/songs/:slug/edit' do

		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		


		erb :'songs/edit'
	end

	patch '/songs/:slug' do

		@song = Song.find_by_slug(params[:slug])
		artist = Artist.find_or_create_by(name: @song.artist.name)
		
		@song.artist = params[:song][:artist]

		@song.save

		flash[:message] = "Successfully updated song."
    	redirect("/songs/#{@song.slug}")


		# redirect "/songs/#{@song.slug}"


	end


	
end
