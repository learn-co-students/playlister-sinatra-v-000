class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.find_by_name(params[:song][:name])
    @artist = Artist.find_by_name(params[:artist][:name])
    @song ||= Song.create(params[:song])
    @artist ||= Artist.create(params[:artist])
    @song.artist_id = @artist.id
    @song.save
    params[:genres].each {|genre_id| @song.genres << Genre.find(genre_id)}

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_name(params[:song][:name])
    @song.update(params[:song])
    params[:genres].each {|genre_id| @song.genres << Genre.find(genre_id.to_i)}
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
