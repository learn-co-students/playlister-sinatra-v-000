require 'sinatra/base'
require 'rack-flash'
class SongsController < ApplicationController
	enable :sessions
	use Rack::Flash
	get '/' do
		erb :'songs/index'
	end

	get '/songs' do
		erb :'songs/index'
	end

	get '/songs/new' do
		erb :'songs/new'
	end

	post '/songs/new' do
		@song = Song.create(name: params[:song][:name])
		@song.genres = params[:song][:genres].map {|genre| Genre.find(genre)}
		if !params["genre"]["name"].empty?
		  @song.genres = Genre.create(name: params["genre"]["name"])
		end
		if !Artist.find_by_name(params["artist"]["name"])
	      @song.artist_id = Artist.create(name: params["artist"]["name"]).id
	    else
	      @song.artist_id = Artist.find_by_name(params["artist"]["name"]).id
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
		erb :'songs/edit'
	end

	patch '/songs/:slug' do
		#binding.pry
		@song = Song.find_by_slug(params[:slug])
		@song.update(name: params[:song][:name], genres: params[:song][:genres].map {|genre| Genre.find(genre)})
		@song.update(artist_id: Artist.find_by_name(params["artist"]["name"]).id)
		@song.save
		#if !params["genre"]["name"].empty?
		# @song.update = Genre.create(name: params["genre"]["name"])
		#end
		#if !Artist.find_by_name(params["artist"]["name"])
	    # @song.artist_id = Artist.create(name: params["artist"]["name"]).id
	    #else
	    # @song.artist_id = Artist.find_by_name(params["artist"]["name"]).id
	    #end

	    flash[:message] = "Successfully updated song."
	    #binding.pry
	    redirect "/songs/#{@song.slug}"
	end


end