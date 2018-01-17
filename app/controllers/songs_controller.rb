require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song = Song.create(name: params[:song][:name])
    @song.artist = @artist

    # update the song's genres
    genres = []
    if !params[:song][:genre_ids].empty?
      params[:song][:genre_ids].each do |genre_id|
        genres << Genre.find(genre_id)
      end
    end

    if !params[:genre][:name].empty?
      genre = Genre.find_or_create_by(name: params[:genre][:name])
      if !genres.include?(genre)
        genres << genre
      end
    end
    @song.genres = genres

    @song.save

    # flash message
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    #new song!
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug/edit' do
    # update song based on the params

    @song = Song.find_by_slug(params[:slug])

    # update artist
    if !params[:song][:artist].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist])
      @song.artist = artist
    end

    # update the song's genres
    genres = []
    if !params[:song][:genre_ids].empty?
      params[:song][:genre_ids].each do |genre_id|
        genres << Genre.find(genre_id)
      end
    end

    if !params[:genre][:name].empty?
      genre = Genre.find_or_create_by(name: params[:genre][:name])
      if !genres.include?(genre)
        genres << genre
      end
    end
    @song.genres = genres

    @song.save
    # flash message
    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
