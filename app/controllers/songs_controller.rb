class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort { |a, b| a.name <=> b.name }
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all.sort { |a, b| a.name <=> b.name }
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:song][:genre_ids]
    if !params["Genre Name"].empty?
      @song.genres << Genre.create(name: params["Genre Name"])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all.sort { |a, b| a.name <=> b.name }
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"])
    @song.artist.update(name: params["Artist Name"])
    @song.genre_ids = params[:song][:genre_ids]
    if !params["Genre Name"].empty?
      @song.genres << Genre.create(name: params["Genre Name"])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
