require 'rack-flash'

class SongsController < ApplicationController
	use Rack::Flash

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

	get '/artists' do
		@artists = Artist.all
		erb :'/artists/index'
	end

	get '/genres' do
		@genres = Genre.all
		erb :'/genres/index'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		# binding.pry
		erb :'songs/show'
	end

	post '/songs/new' do
		@song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
		# binding.pry
    @song.genre_ids = params[:genres]
    @song.save

		flash[:message] = "Successfully created song."

		redirect("/songs/#{@song.slug}")
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	patch '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song.update(params[:song])
		@song.artist = Artist.find_or_create_by(name:params[:artist][:name])
		@song.save

		flash[:message] = "Successfully updated song."
		redirect("/songs/#{@song.slug}")
	end
end
