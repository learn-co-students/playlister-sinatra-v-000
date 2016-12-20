class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    if !params[:artist][:name].empty?
      @song = Song.create(
        name: params[:name],
        artist: Artist.find_or_create_by(name: params[:artist][:name]),
        genre_ids: params[:genres]
      )
    else
      @song = Song.create(
        name: params[:name],
        artist: Artist.find(params[:artist][:id]),
        genre_ids: params[:genres]
      )
    end
    @song.save
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
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
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist][:name].empty?
      @song.name = params[:name]
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
    else
      @song.name = params[:name]
      @song.artist = Artist.find(params[:artist][:id])
      @song.genre_ids =  params[:genres]
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{params[:slug]}"
  end

end
