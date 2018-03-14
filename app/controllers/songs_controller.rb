require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

	get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.new(params[:song])
    # binding.pry
    # if @artist = Artist.find_by()

    # binding.pry
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
    end

    
    if !params[:genre].empty?
      # binding.pry
      @song.genres << Genre.create(params[:genre])
    end
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find(params[:artist])
    flash[:message] = "Successfully updated song."
    erb :'/songs/show'
  end
end