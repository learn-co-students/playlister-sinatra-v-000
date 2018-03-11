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
    @song = Song.new(params[:song])

    if @artist =Artist.find_by(name: params[:artist][:name])
      @song.artist = @artist
    else
      @song.build_artist(params[:artist])
    end

    @song.save
    redirect "/songs/#{@song.slug}"
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

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    if @song.artist.name != params[:artist][:name]
      @artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.artist = @artist
    end

    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
