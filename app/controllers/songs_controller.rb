class SongsController < ApplicationController
  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #need to turn the slug into an id
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    if @song.save
      '<%= flash[:notice] = "Successfully created song."%>'
    end
    redirect to "/songs/#{@song.slug}"
  end
end
