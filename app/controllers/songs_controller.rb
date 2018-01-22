class SongsController < ApplicationController
use Rack::Flash
	
#enable :sessions

	get '/songs' do 
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

  post '/songs' do 	
		@song = Song.find_or_create_by(name: params[:song][:name])
		@artist = Artist.find_or_create_by(name: params[:artist][:name])
		@song.artist = @artist
		@song.save
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug' do 
		slug = params[:slug]
		@song = Song.find_by_slug(slug)
		erb :"/songs/show"
	end


end
