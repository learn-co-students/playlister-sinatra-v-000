class ArtistsController < ApplicationController

	get '/artists' do
	  @artists = Artist.all
	  erb :index
	end

	get '/artists/:slug' do

	end

end
