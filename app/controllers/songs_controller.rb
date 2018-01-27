class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    slug = @song.slug
    
    params["genres"].each do |genre_id|
      genre = Genre.find(genre_id.to_i)
      @song.genres << genre
    end

    @song.artist = Artist.create(name: params[:artist_name])
    @song.save

    # @song.artist.save
    redirect to "/songs/#{slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
