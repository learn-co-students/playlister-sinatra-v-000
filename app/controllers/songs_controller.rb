	require 'rack-flash'


class SongsController < ApplicationController
	use Rack::Flash

	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/edit'
	end

	post '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		artist = Artist.find_or_create_by(name: params[:artist_name])
		genre_list = params[:song][:genre]
		genres = genre_list.collect {|genre|Genre.find_or_create_by(name: genre)}
		@song.update(artist: artist, genres: genres)
		flash[:message] = "Successfully updated song."
		redirect "/songs/#{@song.slug}"
	end

	post '/songs' do
		artist = Artist.find_or_create_by(name: params[:artist_name])
		song = Song.create(name: params[:song_name], artist: artist)
		genre_list = params[:song][:genre]
		genres = genre_list.collect {|genre|Genre.find_or_create_by(name: genre)}
		song.genres << genres
		flash[:message] = "Successfully created song."
		redirect "/songs/#{song.slug}"
	end

end