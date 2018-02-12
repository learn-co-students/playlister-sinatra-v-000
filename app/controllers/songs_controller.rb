require 'sinatra/base'
require 'sinatra/flash'

class SongsController < ApplicationController

	enable :sessions
	register Sinatra::Flash

	get '/songs' do
		@songs = Song.all

		erb :'/songs/index'
	end

	get '/songs/new' do #needs to be before :slug method or controller will interpret 'new' as :slug
		erb :'/songs/new'
	end

	post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song." #update view to reflect flash message too
		redirect("/songs/#{@song.slug}")
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])

		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])

		erb :'/songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song.update(params[:song])
		if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
	end

end	