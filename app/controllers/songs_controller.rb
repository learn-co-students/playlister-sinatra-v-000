class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.genres << Genre.find_by(name: params["genre"])
    if Artist.find_by(name: params["Artist Name"]) != nil
      @song.artist = Artist.find_by(name: params["Artist Name"])
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug/edit' do
    erb :'songs/edit'
  end

end
