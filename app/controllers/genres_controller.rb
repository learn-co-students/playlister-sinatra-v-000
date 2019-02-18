class GenresController < ApplicationController

	# index
	get '/genres' do 
		@genres = Genre.all
		erb :'genres/index'
	end

	# new
	get '/genres/new' do 
		erb :'genres/new'
	end

	# create
	post '/genres' do 
		@genre = Genre.create(name: params[:name])
		redirect "/genres/#{@genre.slug}"
	end

	# show
	get '/genres/:slug' do
		@genre = Genre.find_by_slug(params[:slug])
		erb :'genres/show'
	end

end