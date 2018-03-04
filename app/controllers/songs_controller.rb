require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    # binding.pry
    if !params[:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      # binding.pry
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    else
      @song.genre_ids = params[:genres]
    end
    @song.save
    flash[:message] = "Successfully created song."
    # binding.pry
    redirect to("/songs/#{@song.slug}")
  end
end
