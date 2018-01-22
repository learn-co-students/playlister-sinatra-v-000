require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    ###First Attempt ###
    # params[:genres].each do |id|
    #   @song.genres << Genre.all.find_all{|genre| genre.id = id }
    # end
    flash[:message] = "Successfully created song."
    
    redirect "songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    ###First Attempt ###
    # params[:genres].each do |id|
    #   @song.genres << Genre.all.find_all{|genre| genre.id = id }
    # end
    flash[:message] = "Successfully updated song."

    redirect "songs/#{@song.slug}"

  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
# post '/set-flash' do
#    # Set a flash entry
#    flash[:notice] = "Thanks for signing up!"
#
#    # Get a flash entry
#    flash[:notice] # => "Thanks for signing up!"
#
#    # Set a flash entry for only the current request
#    flash.now[:notice] = "Thanks for signing up!"
#  end
