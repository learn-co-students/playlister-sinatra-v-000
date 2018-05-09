class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs' do
    if Artist.find_by_name(params[:song][:artist][:name]) != nil
      @artist = Artist.find_by_name(params[:song][:artist][:name])
    elsif params[:song][:artist][:name] != "name"
      @artist = Artist.create(params[:song][:artist])
    else
      @artist = Artist.find_by_id(params[:song][:artist_id]["{}"].to_i)
    end
    @song = Song.create(name: params[:song][:name], artist: @artist)
    if params[:song][:new_genre] != "name"
      @new_genre = Genre.create(name: params[:song][:new_genre])
      @song.genres << @new_genre
    end
    if !params[:song][:genres].empty?
      @genres_ids = params[:song][:genres].collect {|i| i.to_i}
      @genres_ids.each do |id|
        @song.genres << Genre.find_by_id(id)
      end
      @song.save
    end
     redirect to "songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if Artist.find_by_name(params[:song][:artist][:name]) != nil
      @artist = Artist.find_by_name(params[:song][:artist][:name])
    elsif params[:song][:artist][:name] != "name"
      @artist = Artist.create(params[:song][:artist])
    elsif params[:song][:artist_id] != nil
      @artist = Artist.find_by_id(params[:song][:artist_id]["{}"].to_i)
    else
      @artist = @song.artist
    end
    @song.artist = @artist
    @song.genres.clear
    if params[:song][:new_genre] != "name"
      @new_genre = Genre.create(name: params[:song][:new_genre])
      @song.genres << @new_genre
    end
    if !params[:song][:genres].empty?
      @genres_ids = params[:song][:genres].collect {|i| i.to_i}
      @genres_ids.each do |id|
        @song.genres << Genre.find_by_id(id)
      end
      @song.save
    end

    redirect to "songs/#{@song.slug}"
  end


end
