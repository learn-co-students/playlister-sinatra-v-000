require 'rack-flash'
class SongsController < ApplicationController
enable :sessions
  use Rack::Flash

  get '/songs/new' do
    @songs = Song.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    if !!Artist.find_by(name: params["Artist Name"])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song = Song.create(:name => params["Name"], :artist_id => @artist.id)
      @song.genres << Genre.find_by(id: params["Genre Name"])
      @song.save
      redirect to "/songs/#{@song.slug}"
    else
      @artist = Artist.create(:name => params["Artist Name"])
      artist_id = @artist.id
      @song = Song.create(:name => params["Name"],:artist_id => artist_id)
      @song.genres << Genre.find_by(id: params["Genre Name"])
      @song.save
      redirect to "/songs/#{@song.slug}"
    end
  end

  get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      @genres = Genre.all
      erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
        @song.save
        redirect to "/songs/#{@song.slug}"
     erb :'/songs/show'
    end


  get '/songs/:slug' do
    flash[:message] = "Successfully updated song."
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end



end
