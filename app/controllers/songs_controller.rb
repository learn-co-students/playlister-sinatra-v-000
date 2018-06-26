require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    #binding.pry
    @songs = Song.all

    erb :'/songs/index'
  end


  get '/songs/new' do
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist


    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])
    #binding.pry
    @artist = Artist.create(name: params["Artist Name"])
    @artist.save
    @song.artist = @artist
    binding.pry
    genre_list = params["genres"]
    genre_list.each do |genre_id|
      @song.genres << Genre.find_by(id: genre_id)
    end
    binding.pry
    #@song.genres = params["genres"]
    @song.save
    binding.pry

    #puts "Song name: #{@song.name}"
    #puts "Aritst: #{@artist.name}"
    #puts "Genre: #{@song.genres}"
    flash[:message] = "Successfully created song."
    #binding.pry

    redirect to "/songs/#{@song.slug}"

  end


end
