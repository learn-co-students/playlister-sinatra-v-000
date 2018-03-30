class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do #index
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do #new

    erb :'songs/new'
  end

  post '/songs' do #create
    @song = Song.new(name: params[:song_name])

    if artist = Artist.find_by_name(params[:artist_name])
      @song.artist = artist
    else
      @song.artist = Artist.create(name: params[:artist_name])
    end

    @genre = Genre.find_by_id(params[:genres])
    @song.genres << @genre
    @song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do #show
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do #edit
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do #update
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]

    if artist = Artist.find_by_name(params[:artist_name])
      @song.artist = artist
    else
      @song.artist = Artist.create(name: params[:artist_name])
    end

    @song.save

    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end
end
