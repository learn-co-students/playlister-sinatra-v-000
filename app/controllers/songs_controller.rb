class SongsControler < ApplicationController

  require 'rack-flash'
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song = Song.create(name: params[:name], artist_id: @artist.id)

    params[:genre_ids].each do |genre_id|
      @genre = Genre.find(genre_id)
      @genre.songs << @song
    end

    flash[:notice] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song.update(params[:name])
    @song.save
    redirect to "/songs/#{@song.slug}"

    # @song.name = params[:name]
    # @song.artist = @artist
    # @song.genres.clear
    # params[:genre_ids].each do |genre_id|
    #   @genre = Genre.find(genre_id)
    #   @genre.songs << @song
    # end
    # flash[:notice] = "Successfully updated song."
  end

end
