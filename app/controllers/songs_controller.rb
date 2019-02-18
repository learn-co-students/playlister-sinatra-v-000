class SongsController < ApplicationController

	# index
	get '/songs' do 
		@songs = Song.all
		erb :'songs/index'
	end

	# new
	get '/songs/new' do 
		erb :'songs/new'
	end

	# create
	post '/songs' do 
		binding.pry
		@song = Song.create(name: params[:name])
		redirect "/songs/#{@song.slug}"
	end

	# show
	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug]) 
		erb :'songs/show'
	end

end