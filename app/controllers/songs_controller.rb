require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if Artist.find_by(params[:artist])
      @song.artist = Artist.find_by(params[:artist])
    else
      @song.artist = Artist.create(params[:artist])
    end
    @song.genres << Genre.find(params[:genres])
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :"/songs/edit"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save


    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
