class SongsController < ApplicationController

	get '/songs' do
	  @songs = Song.all
	  erb :'/songs/index'
	end

	get '/songs/new' do
		binding.pry
		erb :'/songs/new'
	end

	get '/songs/:slug' do
		binding.pry
		@song_name = Song.find_by_slug(params[:slug]).name
		erb :'/songs/show'
	end

	get '/songs/:id' do
		binding.pry
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		binding.pry
	end

end
