class SongsController < ApplicationController

	get '/songs' do
	  @songs = Song.all
	  erb :'/songs/index'
	end

	get '/songs/new' do

		erb :'/songs/new'
	end

	get '/songs/:id' do

		erb :'/songs/show'
	end

	get '/songs/:slug' do
		binding.pry
		Song.slug
	end

	get '/songs/:slug/edit' do

	end

end
