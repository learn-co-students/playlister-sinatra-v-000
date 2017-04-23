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
    erb :'songs/show'
  end

  post '/songs' do

    song = Song.create(params[:song])
    if !!(params[:artist][:id])
      song.artist = Artist.find(params[:artist][:id])
    else
      song.artist = Artist.find_or_create_by(params[:artist])
    end

    song.genres << Genre.find(params[:genres])

    song.save

    flash[:message] = "Successfully created song."
    redirect("/songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    @song.artist = Artist.find_or_create_by(params[:artist])

    @song.genres.clear
    @song.genres << Genre.find(params[:genres])

    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")

  end

end
