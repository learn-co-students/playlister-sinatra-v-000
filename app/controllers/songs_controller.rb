require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    if @artist = Artist.find_by(params[:artist])
      @song.artist = @artist
    else
      @song.artist = Artist.create(params[:artist])
    end
    params[:genre].each do |k,v|
      @song.genres << Genre.find_by(params[:genre])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug.downcase}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:song][:slug])
    @song.update(params[:song])
    if params[:artist][:name] != ""
      @song.artist = Artist.create(params[:artist])
    end
    @song.save
    slug = @song.slug.downcase
    redirect "/songs/#{slug}"
  end


end
