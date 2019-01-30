class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
      #binding.pry
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

    #solo
  post '/songs' do
    @song = Song.create(name: params['Name'])
    @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
      #@song.genre_ids = params[:genres] #wth is this?
    @song.save

      #flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs/new' do
    erb '/songs/new'
  end

end
