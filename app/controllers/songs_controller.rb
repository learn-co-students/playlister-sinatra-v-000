class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist])
    #genres = params[:genres].map {|genre| Genre.find_or_create_by(name: genre)}
    @song = Song.create(name: params[:name], artist: artist)
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all || [{name=>"blah"}, {name=>"bloop"}, {name=>"bloop"}]
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
end
