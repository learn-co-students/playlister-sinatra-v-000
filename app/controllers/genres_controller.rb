class GenresController < ApplicationController

	get '/genres' do
		@genres = Genre.all
		erb :'/genres/index'
	end

	get '/genres/:slug' do
		@genre = Genre.find_by_slug(params[:slug])
		if session[:genre] == "new"
			@current_genre = "new"
			session[:genre] = ""
		elsif session[:genre] == "edit"
			@current_genre = "edit"
			session[:genre] = ""
		end
		erb :'/genres/show'
	end
	
	
end