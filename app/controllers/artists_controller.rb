class ArtistsController < ApplicationController

	get '/artists/:slug' do
  		@artist=Artist.find_by_slug(params[:slug])
    	erb :'artist/artist'
	end

	get '/artists' do
  		@artists=Artist.all
    	erb :'artist/artists'
	end

	get '/artists/new' do
  		@artists=Artist.all
    	erb :'artist/new'
	end

end