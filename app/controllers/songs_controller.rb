class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:genres].each do |genre|
      x = Genre.find(genre)
      @song.genres << x
    end
    @song.save
    redirect "/songs", locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @success_message = session[:success_message]
    session[:success_message] = nil
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.genres.delete_all
    params[:genres].each do |genre|
      x = Genre.find(genre)
      @song.genres << x
    end
    @song.save
    session[:success_message] = "Song successfully updated."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
end