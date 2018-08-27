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

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    if params[:song][:artist][:id]
      @song.artist_id = params[:song][:artist][:id]
    end
    if !params[:song][:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    end
    if !params[:song][:genres].empty?
      params[:song][:genres][:ids] = [] if !params[:song][:genres][:ids]
      if !params[:song][:genres][:names].empty?
        params[:song][:genres][:names].split(",").map!(&:strip).each do |name|
          genre = Genre.create(name: name)
          params[:song][:genres][:ids] << genre.id
        end
      end
      params[:song][:genres][:ids].each do |genre_id|
        @song.song_genres.create(genre_id: genre_id)
      end
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
