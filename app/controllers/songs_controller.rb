require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["song"]["artist"])
    @song = Song.create(name: params["song"]["name"])
    @song.artist = @artist
      if params["genres"] != nil
        params["genres"].each do |genre_id|
          if Genre.find(genre_id)
            @song.genre_ids << genre_id
          else
            @genre = Genre.create(name: params["genre"])
            @song.genre_ids << @genre.id
          end
        end
      else
        @genre = Genre.create(name: params["genre"][0])
      end
    @song.save

    erb :'songs/show'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end
end
