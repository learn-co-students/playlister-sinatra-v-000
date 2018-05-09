class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    @song.save
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.all.detect { |song| song.slug == slug}
    erb :'songs/show'
  end
end
