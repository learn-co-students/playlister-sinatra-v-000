class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    if Artist.find_by_name(params["Artist Name"]) == nil
      @song = Song.create(name: params[:Name], artist: Artist.create(name: params["Artist Name"]))
    else
      @song = Song.create(name: params[:Name], artist: Artist.find_by_name(params["Artist Name"]))
    end
    @song.genres << Genre.find_by_id(params[:genres])
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song.artist.name != (params["Artist Name"])
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.genres.clear
    params[:genres].each { |x| @song.genres << Genre.find_by_id(x) }
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end
end
