require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # puts @song.name
    # puts @song.artist.name
    # puts @song.artist.slug
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    session["edit_song_slug"] = @song.slug
    erb :'songs/edit'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if params[:artist] != nil
      artist = Artist.find_or_create_by(params[:artist])
      @song.artist = artist
    end

    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"


  end

  post '/songs' do
    @song = Song.create(params[:song])

    # artistName = params[:artist][:name]
    # artistSlug = artistName.downcase.gsub(" ","-")
    # artistSlug.gsub!(/[^0-9A-Za-z\-]/, '')
    # artist = Artist.new
    #
    # if Artist.find_by_slug(artistSlug) == nil
    #   artist.name = artistName
    #   # puts artist.name
    #   artist.save
    # else
    #   artist = Artist.find_by_slug(artistSlug)
    #   # puts artist.name
    # end

    artist = Artist.find_or_create_by(params[:artist])

    @song.artist = artist
    @song.genre_ids = params[:genres]
    # puts @song.artist
    # puts @song.artist.slug
    @song.save

    flash[:message] = "Successfully created song."

    redirect to "songs/#{@song.slug}"

  end


end
