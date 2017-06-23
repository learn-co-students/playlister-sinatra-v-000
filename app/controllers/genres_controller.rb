class GenresController < ApplicationController

	get '/genres' do
	  @genres = Genre.all
	  erb :'/genres/index'
	end

	get '/genres/:slug' do
		binding.pry
		erb :'/genres/show'
	end

	get '/genres/:id' do
		binding.pry
		erb :'/genres/show'
	end

end
