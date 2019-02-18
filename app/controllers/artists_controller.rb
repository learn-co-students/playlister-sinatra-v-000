class ArtistsController < ApplicationController

	# index
	get '/artists' do 
		@artists = Artist.all
		erb :'artists/index'
	end

	# new
	get '/artists/new' do 
		erb :'artists/new'
	end

	# create
	post '/artists' do 
		@artist = Artist.create(name: params[:name])
		redirect "/artists/#{@artist.slug}"
	end

	# show
	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])
		erb :'artists/show'
	end

end
