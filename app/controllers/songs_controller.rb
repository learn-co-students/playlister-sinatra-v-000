
class SongsController < ApplicationController

	enable :sessions
	use Rack::Flash

	get '/songs' do
		@song = Song.all
		erb :'/songs/index'
	end	

	get '/songs/new' do
		@song = Song.all
		@genre = Genre.all
		erb :'songs/new'
	end

	post '/songs' do 
		@song = Song.create(name: params[:name])
		if !Artist.find_by(name: params[:artist_name])
			@song.artist = Artist.create(name: params[:artist_name])
		else
			@song.artist = Artist.find_by(name: params[:artist_name])
		end
		params[:genres].each do |new_genre|
			@song.genres << Genre.find_by(name: new_genre)
		end	
		@song.save
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"	
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end	

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genre = Genre.all
		erb :'songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		if !params[:name].empty?
			@song.name = params[:name]
		end	
		if !params[:artist_name].empty?
			@song.artist = Artist.create(name: params[:artist_name])
		end
		if !params[:genres].empty?
			@song.genres.clear
			params[:genres].each do |new_genre|
				@song.genres << Genre.find_by(name: new_genre)
			end
		end	
		@song.save	
		flash[:message] = "Successfully updated song."
		erb :'songs/show'
	end

end