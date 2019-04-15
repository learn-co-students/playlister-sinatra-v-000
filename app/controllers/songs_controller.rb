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


  post '/songs' do
    @song = Song.create(params[:name])

    # Song belongs to 1 artist
<<<<<<< HEAD
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

    #Song has multiple genres
    @song.genre.id = Genre_ids.all
    @song.genre = params([:genres => params[genre_ids])

    #save instance of a song
    @song.save
=======
    @song.artist = Artist.find_or_create_by(:name =>params["Artist Name"])

    #Song has multiple genres
    # @song.genre = Genre.find
    # @song.genre = Genre.all
    # @genre = Genre.find_by_slug(params[:slug])

>>>>>>> 5934f4c2717d6b1d6204d4b8326e4f05f72dd12d

    flash[:message] = "Successfully created song"
    redirect("/songs/#{@song.slug}")

  end


  get 'songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  get 'songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end




  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song = Song.update(params[:song])
    #@song = song.update(params[:song])

    #update song.artist because artist has multiple songs and genres
    @song.artist =
binding.pry
    #update genres because song has multiple genres
    @song.genre_ids =
    # @song.genre =



    flash[:message] = "Successfully updated song."
    redirect ("/songs/#{@song.slug}")
    erb :'songs/update'


      end
end
