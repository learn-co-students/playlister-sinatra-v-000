class SongsController < ApplicationController



  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    Artist.all.each do |artist|
      if artist.name == params[:song][:artist]
        @artist = artist
        @genres = Genre.find(params[:song][:genre_ids])
        @song = Song.create(name: params[:song][:name], genres: @genres, artist: @artist)
      end
    end
    if !Artist.all.include?(@artist)
      @artist = Artist.create(name: params[:song][:artist])
      @genres = Genre.find(params[:song][:genre_ids])
      @song = Song.create(name: params[:song][:name], genres: @genres, artist: @artist)
    end

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist].empty?
      @song.artist = Artist.create(name: params[:song][:artist])
    end
    #binding.pry
    erb :'/songs/show'
  end

end
