require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to '/songs/#{@song.slug}'
  end

end
