class GenresController < ApplicationController 

	get '/genres' do 
  	@genres = Genre.all 
  	erb :'genres/genres_list'
  end 

  get '/genres/:slug' do 
  	@genre = Genre.find_by_slug(params[:slug])
  	erb :'genres/show_genre'
  end


end