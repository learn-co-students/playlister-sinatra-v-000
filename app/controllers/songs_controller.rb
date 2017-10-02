require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash


  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @genre_ids = params[:song][:genre_ids]

    if !params[:artist][:name].empty?
      if !Artist.all.detect {|a| a.name == params[:artist][:name]}
        @song.artist = Artist.create(:name => params[:artist][:name])
      else
        @song.artist = Artist.find_by(name: params[:artist][:name])
      end
    else
      @song.artist = Artist.find(params[:song][:artist_id])
    end

    #FIX THE GENRES THING!  GENRE ISNT REALLY GETTING ASSIGNED!

    @song.save
    flash[:message] = "Successfully created song."
    binding.pry
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    binding.pry


    if !params[:artist][:name].empty?
      if !Artist.all.detect { |a| a.name == params[:artist][:name]}

        @song.artist = Artist.create(:name => params[:artist][:name])
      else
        @song.artist = Artist.find_by(:name => params[:artist][:name])
      end
    else
      @song.artist = Artist.find(params[:song][:artist_id])
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
