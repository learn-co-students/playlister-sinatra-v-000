class SongsController < ApplicationController

  get '/songs' do
    @Songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(:slug)
    erb :'/songs/show'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    @song.save
    redirect to "owners/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(:slug)
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(:slug)
    @song.update(params["song"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    redirect to "song/#{@song.slug}"
  end
end
