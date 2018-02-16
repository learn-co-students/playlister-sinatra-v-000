class ArtistsController < ApplicationController

	get '/artists' do

	  erb :'artists/index'
	end

	get '/artists/:slug' do
	  @artist = Artist.find_by_slug(params[:slug])

	  erb :'/artists/show'
	end

	post '/artists' do
		@artist = Artist.create(params[:artists])

	  erb :'/artists/:slug'
	end


end