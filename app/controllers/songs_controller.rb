class SongsController < ApplicationController



  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    redirect "songs/#{@song.slug}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !@song
      return redirect :'songs/index'
    end
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.update(name: params["Artist"])
    redirect "songs/#{@song.slug}"
  end

end
