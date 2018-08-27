class SongsController < ApplicationController
	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	post '/songs/new' do
		@song = Song.create(name: params["name"])
		if Artist.all.find_by_name(params["artist"]["name"]).nil?
			artist = Artist.create(name: params["artist"]["name"])
		else
			artist = Artist.find_by_name(params["artist"]["name"])
		end
		@song.artist = artist

		# do i need to create genres dont they already exist, and
		# I just need associations?
		@song.genres << Genre.find_by_name(name: params["genre"]["name"][])
		#associate array of genre objects to @song.genres
		@song.save
		binding.pry
		redirect to '/songs/:slug'
	end
end






  #none of the following variations worked
  #artist = Artist.find(name: params["artist"]["name"]) #dont know why
  #artist = Artist.all.find(name: params["artist"]) #missing ["name"]
  #artist = Artist.find(params["artist"]) #missing ["name"]
  #artist = Artist.find(name: params["artist"]) #missing ["name"]
  #artist = Artist.find_by_name(params["artist"]) #missing ["name"]
