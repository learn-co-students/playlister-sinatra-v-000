class SongsController < ApplicationController

	get '/songs' do
	  @songs = Song.all
	  erb :index
	end

	get '/songs/new' do

	end

	get '/songs/:slug' do

	end

	get '/songs/:slug/edit' do

	end

end
