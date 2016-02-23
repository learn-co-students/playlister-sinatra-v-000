
class GenreController < ApplicationController
	 set :views, Proc.new { File.join(root, "../views/") }
	
	get '/genres' do
		erb :'genres/genres'
	end
	
	get '/genres/:slug' do
		@genre = Genre.find_by_slug(params[:slug])
		erb :'genres/genre'
	end
	
end