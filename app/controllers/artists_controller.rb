class ArtistsController < ApplicationController

	get '/artists' do
	  @artists = Artist.all
	  erb :'/artists/index'
	end

	get '/artists/:slug' do
		binding.pry
		erb :'/artists/show'
	end

	get '/artists/:id' do
		binding.pry
		erb :'/artists/show'
	end

end
