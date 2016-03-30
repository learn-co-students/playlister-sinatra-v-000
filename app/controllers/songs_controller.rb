class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.genre_ids = params[:song][:genre_ids]

    if !params[:artist][:name].empty?
      @song.artist = Artist.new(name: params[:artist][:name])
    else
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.new(name: params[:genre][:name])
    end
    
    @song.save
    erb :'/songs/show', locals: {message: "Successfully created song."}     
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name]
    @song.genre_ids = params[:song][:genre_ids]
    if !params[:artist][:name].empty?
      @song.artist = ARtist.new(name: params[:artist][:name])
    else
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.new(name: params[:genre][:name])
    end
    @song.save
    erb :'/songs/#{@song.slug}', locals: {message: "Song successfully updated."}
  end

end