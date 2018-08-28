require 'rack-flash'
class SongsController < ApplicationController
	use Rack::Flash

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	post '/songs' do
		#binding.pry
		@song = Song.create(name: params["Name"])
		#binding.pry
		@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
		#what the hell is going on, on line 23, how does that relate to my params name="["artist"]["name"]" this looks like and id "reference"
		@song.genre_ids = params[:genres]
		@song.save
		#binding.pry
		flash[:message] = "Successfully created song."
		redirect("/songs/#{@song.slug}")
	end

	get 'songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug]) #
		@song.update(params[:song])
		@song.artist = Artist.find_or_create_by(name: params[:artist][:name])
		#do I create or alter genre names or just the genres selected for this song?
		#@song.song_genres.create(genre: params)
		@song.genre_ids = params[:genres]
		@song.save
		flash[:message] = "Successfully updated song."
		redirect("/songs/#{@song.slug}")
	end
end




#flash message directions say to put if statement at top of view, does not indicate which view

  #none of the following variations worked
  #artist = Artist.find(name: params["artist"]["name"]) #dont know why
  #artist = Artist.all.find(name: params["artist"]) #missing ["name"]
  #artist = Artist.find(params["artist"]) #missing ["name"]
  #artist = Artist.find(name: params["artist"]) #missing ["name"]
  #artist = Artist.find_by_name(params["artist"]) #missing ["name"]
