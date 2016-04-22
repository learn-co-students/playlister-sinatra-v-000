class SongsController < ApplicationController
 
  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
       erb :'songs/new'
  end

    get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post "/songs" do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist_id = Artist.create(name: params["artist"]["name"]).id

    end
    @song.save
    redirect "song/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:artist])
    @song.save
    erb :'songs/show'
  end



end