require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
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
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    params["genres"].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id.to_i)
    end
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry


    #if @song.name != params[:song][:name]
      @song.name = params[:song][:name]
      #flash[:message] = "Song name updated"
    #end

    #if @song.artist != params[:artist][:name]
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    #  flash[:message] = "Artist name updated"
    #end
      params[:song][:genres].each do |genre_name|
        if !@songs.genres.include?(Genre.find_by_name(genre_name))
          @songs.genres << Genre.find_by_name(genre_name)
        end
      end

    @song.save

    redirect "/songs/#{@song.slug}"
  end


end
