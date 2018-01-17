require 'rack-flash'

class SongController < ApplicationController
	use Rack::Flash

	get '/songs' do
		erb :'songs/index'
	end

	get '/songs/new' do
		erb :'songs/new'
	end

	post '/songs' do

		@song = Song.create(name: params["song"]["name"])
		if params["song"]["artist_id"]
			@song.artist_id = params["song"]["artist_id"]
		elsif !params["artist"]["name"].empty?
			if Artist.find_by(name: params["artist"]["name"])
			@song.artist = Artist.find_by(name: params["artist"]["name"])
			else
			@song.artist = Artist.create(name: params["artist"]["name"])
			end
		end
		params["song"]["genre_ids"].each do |id|
			genre = Genre.all.find_by(id: id)
			@song.genres << genre
		end
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

	post '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
    	@song.update(params[:song])
    	if !params["artist"]["name"].empty?
    		Song.update(@song.id, Artist.create(name: params["artist"]["name"]))
    	end
		flash[:message] = "Successfully updated song."
		redirect to "/songs/#{@song.slug}"
	end
end