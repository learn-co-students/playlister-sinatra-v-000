class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all
		erb :'/artists/index'
	end

	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])
		if session[:artist] == "new"
			@current_artist = "new"
			session[:artist] = ""
		elsif session[:artist] == "edit"
			@current_artist = "edit"
			session[:artist] = ""
		end
		erb :'/artists/show'
	end
end