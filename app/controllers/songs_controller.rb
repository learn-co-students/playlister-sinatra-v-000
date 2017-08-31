require 'rack-flash' 

class SongsController < ApplicationController  

	use Rack::Flash

	get '/songs' do
		@songs = Song.all
		erb :'songs/index'
	end

	get	'/songs/new' do
		@genres = Genre.all
		erb :'songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	post '/songs' do
		@song = Song.create(params["song"])
		@artist = Artist.all.find {|a| a.name == params["artist"]["name"]}
		 if !params["artist"].empty? && !@artist
		 	@song.artist = Artist.create(name: params["artist"]["name"])
		 else
		 	@song.artist = @artist
		 end
		@song.save
		flash[:message] = "Successfully created song."
		redirect to "/songs/#{@song.slug}"
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song.update(params["song"])
		@artist = Artist.all.find {|a| a.name == params["artist"]["name"]}
		if !params["artist"].empty? && !@artist
		 	@song.artist = Artist.create(name: params["artist"]["name"])
		 else
		 	@song.artist = @artist
		 end
		 @song.save
		flash[:message] = "Successfully updated song."
		redirect to "songs/#{@song.slug}"
	end

end