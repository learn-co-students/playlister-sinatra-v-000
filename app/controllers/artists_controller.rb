class ArtistsController < ApplicationController

	get '/artists' do 
  	@artists = Artist.all 
  	erb :'artists/artists_list'
  end 

  get '/artists/:slug' do 
  	@artist = Artist.find_by_slug(params[:slug])
  	erb :'artists/show_artist'
  end

end