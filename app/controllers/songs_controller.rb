
class SongsController < ApplicationController

	get '/songs' do
		@song = Song.all
		erb :'/songs/index'
	end	

	get '/songs/new' do
		@song = Song.all
		erb :'songs/new'
	end

	post '/songs' do
		@song = Song.create(name: params[:name])
		if !Artist.find_by(name: params[:artist_name])
			@song.artist = Artist.create(name: params[:artist_name])
		else
			@song.artist = Artist.find_by(name: params[:artist_name])
		end
		params[:genre].each do |new_genre|
			@song.genre = new_genre
		end	
		@song.save
		redirect to "/songs/#{@song.slug}"		
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end	
end