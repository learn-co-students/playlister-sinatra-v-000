class GenresController < ApplicationController
	get '/genres/:slug' do
  		@genre=Genre.find_by_slug(params[:slug])
    	erb :'genre/genre'
	end

	get '/genres' do
  		@genres=Genre.all
    	erb :'genre/genres'
	end

	get '/genres/new' do
    	erb :'genre/genres'
	end

end