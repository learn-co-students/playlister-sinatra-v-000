class SongsController < ApplicationController

  register Sinatra::Flash
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  patch '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    new_artist = params[:artist_name]
    new_genre = Genre.find(params[:song][:genres])

    if @song.artist.name != new_artist
      @song.artist = Artist.create(:name => new_artist)
    end

    if new_genre
      @song.genres = []
      @song.genres << new_genre
    end

    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  # patch '/songs/' do
  #   binding.pry
  #   @song = Song.find_by_slug(params[:slug])
  #   new_artist = params[:artist_name]
  #   new_genre = Genre.find(params[:song][:genres])
  #
  #   if @song.artist.name != new_artist
  #     @song.artist = Artist.create(:name => new_artist)
  #   end
  #
  #   if new_genre
  #     @song.genres = []
  #     @song.genres << new_genre
  #   end
  #
  #   @song.save
  #   flash[:message] = "Successfully updated song."
  #   redirect "/songs/#{@song.slug}"
  # end

  post '/songs' do
    @song = Song.create(:name => params[:name])
    params[:genres].each do |genre|
      genre = Genre.find(genre)
      @song.song_genres.build(:genre => genre).save
    end

    artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.artist = artist

    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

end
