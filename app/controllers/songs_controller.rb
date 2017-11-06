class SongsController < ApplicationController

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
    @song = Song.new
    @song.name = params[:song][:name]
    if !params[:song][:artist_name].empty?
      @song.artist = Artist.create(name: params[:song][:artist_name])
    end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
  #  binding.pry
    redirect "/songs/#{@song.slug}"
  end
end
