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

  post '/songs' do
    @song = Song.create(params[:song])
    genre = Genre.find(params[:genre][:id])
    @song.genres << genre

    if !params[:artist][:name].empty?
      @song.artist = Artist.create(params[:artist])
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
