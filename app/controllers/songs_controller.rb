require 'sinatra/base'
require 'rack-flash'



class SongsController < ApplicationController
	  configure do
    enable :sessions
    use Rack::Flash 
    use Rack::MethodOverride
end

	get '/songs' do 
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do

	erb :'/songs/new'
	end


	get '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	post '/songs' do 
		@new_song = Song.create(params[:song])
		@new_song.artist = Artist.find_or_create_by(name: params[:artist][:name])
		if !params[:genre][:name].empty?
			@new_song.genres << Genre.create(name: params[:genre][:name])
		end

		@new_song.save

		flash[:message] = "Successfully created song."

	redirect to "/songs/#{@new_song.slug}"
	end

	get '/songs/:slug/edit' do 
		@song = Song.find_by_slug(params[:slug])

		erb :"/songs/edit"
	end

	patch '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug]) 
		@song.name = params[:song][:name]
		@song.artist = Artist.find_or_create_by(name: params[:artist][:name])
		@song.genres = params[:song][:genre_ids].collect{|id| Genre.find(id)}
		@song.save


		flash[:message] = "Successfully updated song."
		redirect to "/songs/#{@song.slug}"
	end


end
