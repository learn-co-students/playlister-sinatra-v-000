class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
      erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/' do
    @song = Song.new(name: params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist])

    genre = params[:genres].collect do |t|
      Genre.find_or_create_by(name: t)
    end

    @song.genres = genre
    @song.save
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # @song = Song.last
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if params[:song]
      @song.name = params[:song]
    end

    if params[:artists]
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    elsif params[:artist]
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    end
    @song.genres = []

    if params[:genres]
        params[:genres].each do |t|
        @song.genres << Genre.find_or_create_by(name: t)
        end
      end
      slug = params[:slug]
      @song.slug = params[:slug]

    @song.save

    flash[:message] = "Successfully updated song. Song name: #{@song.name}.  Artist Name:#{@song.artist}.  Genre(s):#{@song.genres}."

    redirect to "/songs/#{slug}"
  end
end
