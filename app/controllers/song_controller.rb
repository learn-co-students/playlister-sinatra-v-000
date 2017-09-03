
class SongController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])


    erb :'songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.new(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    params[:genres].each {|id| @song.genres << Genre.find(id)}
    @song.save

    flash[:notice] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name]) unless params[:artist_name].empty?
    @song.genres.clear
    params[:genres].each {|id| @song.genres << Genre.find(id)}
    @song.save

    flash[:notice] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
