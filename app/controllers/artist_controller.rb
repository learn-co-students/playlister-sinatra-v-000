
class ArtistController < ApplicationController
	 set :views, Proc.new { File.join(root, "../views/") }
	
	get '/artists' do
		erb :'artists/artists'
	end
	
	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])
		erb :'artists/artist'
	end
	
end