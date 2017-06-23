class GenresController < ApplicationController

	get '/genres' do
	  @genres = Genre.all
	  erb :'/genres/index'
	end

	get '/genres/:id' do

		erb :'/genres/show'
	end

	get '/genres/:slug' do

	end

end
